//
//  MemoryBuffer.swift
//  Chart
//
//  Created by Vitali Kurlovich on 3/14/20.
//  Copyright © 2020 Vitali Kurlovich. All rights reserved.
//

import Foundation

extension MemoryBuffer: Equatable {
    static func == (lhs: MemoryBuffer<T>, rhs: MemoryBuffer<T>) -> Bool {
        guard lhs.count == rhs.count else {
            return false
        }

        for index in 0 ..< lhs.count {
            guard lhs[index] == rhs[index] else {
                return false
            }
        }

        return true
    }
}

internal
final class MemoryBuffer<T: BinaryInteger> {
    private let buffer: UnsafeMutableBufferPointer<T>

    init(_ capacity: Int) {
        buffer = UnsafeMutableBufferPointer<T>.allocate(capacity: capacity)
    }

    deinit {
        buffer.deallocate()
    }

    subscript(position: Int) -> T {
        get {
            buffer[position]
        }
        set(value) {
            buffer[position] = value
        }
    }

    var count: Int {
        buffer.count
    }
}
