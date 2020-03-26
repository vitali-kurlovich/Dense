//
//  SequenceAccumulateIterator.swift
//  Dense
//
//  Created by Vitali Kurlovich on 3/26/20.
//

import Foundation

public
struct SequenceAccumulateIterator<S: Sequence>: IteratorProtocol where S.Element: AdditiveArithmetic {
    public typealias Element = S.Element

    private var last: Element?
    private var iterator: S.Iterator

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
    init(_ sequance: S) {
        iterator = sequance.makeIterator()
        last = iterator.next()
    }
}
