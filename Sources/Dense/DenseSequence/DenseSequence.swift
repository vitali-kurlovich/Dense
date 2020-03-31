//
//  DenseDeltaSequence.swift
//  Dense
//
//  Created by Vitali Kurlovich on 3/15/20.
//

import Foundation
// DenseSequence+Codable
public
struct DenseSequence<T: SignedInteger & Codable>: Sequence {
    public typealias Element = T
    public typealias Iterator = DenseSequenceIterator<T>

    internal let initial: Element?
    internal let buffer: DenseArray<Element>

    internal
    init(initial: Element?, buffer: DenseArray<Element>) {
        self.initial = initial
        self.buffer = buffer
    }

    public func makeIterator() -> Iterator {
        DenseSequenceIterator(self)
    }

    public var underestimatedCount: Int {
        buffer.count
    }

    public var capacity: Int {
        buffer.capacity
    }
}

extension DenseSequence {
    public
    init<S: Sequence>(_ sequence: S) where S.Element == T {
        var iterator = sequence.makeIterator()
        if let first = iterator.next() {
            let dropFirst = DeltaSequence(sequence).dropFirst()

            self.init(initial: first, buffer: DenseArray(dropFirst))
        } else {
            self.init(initial: nil, buffer: DenseArray())
        }
    }

    public init() {
        self.init(initial: nil, buffer: DenseArray())
    }
}

public
struct DenseSequenceIterator<T: SignedInteger & Codable>: IteratorProtocol {
    public typealias Element = T

    private var last: Element?
    private var iterator: DenseArray<T>.Iterator

    public
    mutating func next() -> Element? {
        defer {
            if let last = last, let next = iterator.next() {
                self.last = last + next
            } else {
                self.last = nil
            }
        }

        return last
    }

    public
    init(_ sequence: DenseSequence<T>) {
        iterator = sequence.buffer.makeIterator()
        last = sequence.initial
    }
}
