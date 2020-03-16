//
//  DeltaSequence.swift
//  Dense
//
//  Created by Vitali Kurlovich on 3/16/20.
//

import Foundation

public
struct DeltaSequence<S: Sequence>: Sequence where S.Element: SignedNumeric {
    public typealias Element = S.Element

    public typealias Iterator = DeltaSequenceIterator<S>

    private let sequence: S

    public let first: Element?

    public func makeIterator() -> Iterator {
        Iterator(sequence)
    }

    public
    init(_ sequence: S) {
        var iterator = sequence.makeIterator()

        self.sequence = sequence
        first = iterator.next()
    }
}
