//
//  DeltaSequence.swift
//  Dense
//
//  Created by Vitali Kurlovich on 3/16/20.
//

import Foundation

public
struct DeltaSequence<S: Sequence>: Sequence where S.Element: AdditiveArithmetic {
    public typealias Element = S.Element

    public typealias Iterator = SequenceDeltaIterator<S>

    private let sequence: S

    public func makeIterator() -> Iterator {
        Iterator(sequence)
    }

    public
    init(_ sequence: S) {
        self.sequence = sequence
    }

    public var underestimatedCount: Int {
        sequence.underestimatedCount
    }
}
