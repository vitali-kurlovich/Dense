//
//  СompactArray.swift
//  Chart
//
//  Created by Vitali Kurlovich on 3/14/20.
//  Copyright © 2020 Vitali Kurlovich. All rights reserved.
//

import Foundation

#if canImport(os)
    import os.log
#endif

public
struct DenseArray<T: BinaryInteger & Codable> {
    public let endIndex: Int

    private let bitSize: Int

    internal let _min: T?
    internal let _max: T?
    internal let multiplier: T
    internal let buffer: MemoryBuffer<T>
}

extension DenseArray: RandomAccessCollection {
    public typealias Element = T
    public typealias Index = Int
    public typealias SubSequence = ArraySlice<Element>

    public var startIndex: Int {
        0
    }

    public subscript(position: Int) -> T {
        read(at: position)
    }
}

public
extension DenseArray {
    func min() -> T? {
        _min
    }

    func max() -> T? {
        _max
    }

    var capacity: Int {
        buffer.count
    }
}

public
extension DenseArray {
    internal
    init(_ buffer: MemoryBuffer<T>, min: T?, max: T?, multiplier: T, count: Int) {
        _min = min
        _max = max

        self.buffer = buffer

        guard let min = min, let max = max, min != max else {
            bitSize = 0
            endIndex = count
            self.multiplier = 1
            return
        }

        endIndex = count
        self.multiplier = multiplier

        bitSize = requaredBits(for: max - min)
    }
}

public
extension DenseArray {
    init() {
        self.init(MemoryBuffer(0), min: nil, max: nil, multiplier: 0, count: 0)
    }

    init<S: Sequence>(_ sequance: S, min: T?, max: T?, multiplier: T, count: Int) where S.Element ==
        Element {
        _min = min
        _max = max

        guard let min = min, let max = max, min != max else {
            bitSize = 0
            buffer = MemoryBuffer<T>(0)
            endIndex = count
            self.multiplier = 1

            return
        }

        endIndex = count
        self.multiplier = multiplier

        bitSize = requaredBits(for: max - min)

        let bitCount = Int(bitSize) * count
        let typeBitSize = MemoryLayout<T>.size * 8

        if bitSize == MemoryLayout<T>.size * 8 {
            buffer = MemoryBuffer<T>(count)
            buffer[count - 1] = 0
            fillWithoutDense(sequance)
        } else {
            let lenght = bitCount / typeBitSize

            let bits = lenght * typeBitSize

            let capacity = lenght + (bitCount > bits ? 1 : 0)

            buffer = MemoryBuffer<T>(capacity)
            buffer[capacity - 1] = 0

            fill(sequance)
        }
    }

    init<S: Sequence>(_ sequance: S) where S.Element ==
        Element {
        let info = sequance.sequenceInfo()

        _min = info.min
        _max = info.max

        let count = info.count

        guard let min = info.min, let max = info.max, min != max else {
            bitSize = 0
            buffer = MemoryBuffer<T>(0)
            endIndex = count
            multiplier = 1
            return
        }

        endIndex = count
        multiplier = info.gcd

        bitSize = requaredBits(for: max - min)

        let bitCount = Int(bitSize) * count
        let typeBitSize = MemoryLayout<T>.size * 8

        if bitSize == MemoryLayout<T>.size * 8 {
            buffer = MemoryBuffer<T>(count)
            fillWithoutDense(sequance)
        } else {
            let lenght = bitCount / typeBitSize

            let bits = lenght * typeBitSize

            let capacity = lenght + (bitCount > bits ? 1 : 0)

            buffer = MemoryBuffer<T>(capacity)
            buffer[capacity - 1] = 0

            fill(sequance)
        }

        /*
         for idx in 0 ..< buffer.count {
             let val = buffer[idx]

             print("\(val, radix: .binary, toWidth: MemoryLayout<T>.size * 8)")
         }
         */
    }
}

private
extension DenseArray {
    func fill<S: Sequence>(_ sequance: S) where S.Element ==
        Element {
        var iterator = sequance.makeIterator()

        var index = startIndex

        while let value = iterator.next() {
            write(value, at: index)
            index += 1
        }
    }

    func fillWithoutDense<S: Sequence>(_ sequance: S) where S.Element ==
        Element {
        var iterator = sequance.makeIterator()

        var index = 0
        while let value = iterator.next() {
            buffer[index] = value
            index += 1
        }
    }
}

private
extension DenseArray {
    func write(_ value: T, at index: Int) {
        let value = (value - _min!) / multiplier

        let info = bitInfo(for: index)
        let mask = self.mask(info)

        let shift = info.rightBound
        let writeValue: T
        if shift < 0 {
            writeValue = value >> -shift
        } else if shift > 0 {
            writeValue = value << shift
        } else {
            writeValue = value
        }

        let bufferValue = buffer[info.bufferIndex]

        let bufferWriteValue = (bufferValue & mask) | writeValue
        buffer[info.bufferIndex] = bufferWriteValue

        if shift >= 0 {
            return
        }

        write(value, next: next(info))
    }

    func write(_ value: T, next: BitsInfo) {
        let info = next

        let mask = self.mask(info)
        let shift = info.rightBound

        let bufferValue = buffer[info.bufferIndex]

        let writeValue = value << shift

        let bufferWriteValue = (bufferValue & mask) | writeValue
        buffer[info.bufferIndex] = bufferWriteValue
    }
}

private
extension DenseArray {
    func decodeValue(_ value: T) -> T {
        (value * multiplier) + _min!
    }

    func read(at index: Int) -> T {
        if _min == _max {
            return _min!
        }

        if bitSize == MemoryLayout<T>.size * 8 {
            return buffer[index]
        }

        let info = bitInfo(for: index)
        let mask = ~self.mask(info)

        let bufferValue = buffer[info.bufferIndex] & mask

        let shift = info.rightBound

        if shift == 0 {
            return decodeValue(bufferValue)
        } else if shift > 0 {
            let value = self.shift(value: bufferValue, right: shift)
            return decodeValue(value)
        }

        return decodeValue(read(value: bufferValue, next: next(info)))
    }

    func read(value: T, next: BitsInfo) -> T {
        let info = next
        let mask = ~self.mask(info)

        let bufferValue = buffer[info.bufferIndex] & mask

        let shift = info.rightBound

        let lshift = (MemoryLayout<T>.size * 8 - shift)

        return
            self.shift(value: value, left: lshift) |
            self.shift(value: bufferValue, right: shift)
    }
}

private
extension DenseArray {
    func shift(value: T, right: Int) -> T {
        if T.isSigned, right > 0 { /* Fucking Swift DO NOT support Logical shift */
            let signMask = ~(T(1) << ((MemoryLayout<T>.size * 8) - 1))
            let value = (value >> 1) & signMask

            return value >> (right - 1)
        }

        return value >> right
    }

    func shift(value: T, left: Int) -> T {
        value << left
    }
}

private
struct BitsInfo {
    let globalOffset: Int
    let bufferIndex: Int
    let leftBound: Int
    let rightBound: Int
}

private
extension DenseArray {
    func bitInfo(for index: Int) -> BitsInfo {
        let globalOffset = index * bitSize
        let bufferIndex = globalOffset / (MemoryLayout<T>.size * 8)
        let leftBound = globalOffset - bufferIndex * (MemoryLayout<T>.size * 8)
        let rightBound = (MemoryLayout<T>.size * 8) - leftBound - bitSize

        return .init(globalOffset: globalOffset, bufferIndex: bufferIndex, leftBound: leftBound, rightBound: rightBound)
    }

    func next(_ info: BitsInfo) -> BitsInfo {
        guard info.rightBound < 0 else {
            return .init(globalOffset: 0, bufferIndex: 0, leftBound: 0, rightBound: 0)
        }

        let globalOffset = info.globalOffset
        let bufferIndex = info.bufferIndex + 1
        let leftBound = 0
        let rightBound = (MemoryLayout<T>.size * 8) + info.rightBound

        return .init(globalOffset: globalOffset, bufferIndex: bufferIndex, leftBound: leftBound, rightBound: rightBound)
    }

    func mask(_ info: BitsInfo) -> T {
        let mask: T
        if T.isSigned {
            mask = signedMask(info)
        } else {
            mask = unsignedMask(info)
        }

        return mask
    }

    func unsignedMask(_ info: BitsInfo) -> T {
        let mask = ~(~T(0) >> info.leftBound)

        if info.rightBound > 0 {
            return mask | (~((~T(0)) << info.rightBound))
        }
        return mask
    }

    func signedMask(_ info: BitsInfo) -> T {
        let shift = (MemoryLayout<T>.size * 8) - info.leftBound
        let mask = (~T(0) << shift)

        if info.rightBound > 0 {
            return mask | (~((~T(0)) << info.rightBound))
        }

        return mask
    }
}


internal
func requaredBits<T: BinaryInteger>(for value: T) -> Int {
    var v: UInt64 = 2

    for bits in 1 ... (MemoryLayout<T>.size * 8) {
        if value < v {
            return bits
        }
        v *= 2
    }
    return (MemoryLayout<T>.size * 8)
}

