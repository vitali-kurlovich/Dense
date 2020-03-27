//
//  SequenceDelataIterator.swift
//  Dense
//
//  Created by Vitali Kurlovich on 3/15/20.
//

import Foundation

public
struct SequenceDeltaIterator<S: Sequence>: IteratorProtocol where S.Element: AdditiveArithmetic {
    public typealias Element = S.Element

    private var last: Element?
    private var iterator: S.Iterator

    public
    mutating func next() -> Element? {
        guard let next = iterator.next() else {
            return nil
        }

        defer {
            self.last = next
        }

        if let last = last {
            return next - last
        } else {
            return next
        }
    }

    public
    init(_ sequance: S) {
        iterator = sequance.makeIterator()
    }
}
