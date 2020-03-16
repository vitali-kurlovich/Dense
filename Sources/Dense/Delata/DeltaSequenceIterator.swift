//
//  SequenceDelataIterator.swift
//  Dense
//
//  Created by Vitali Kurlovich on 3/15/20.
//

import Foundation

public
struct DeltaSequenceIterator<S: Sequence>: IteratorProtocol where S.Element: SignedNumeric {
    public typealias Element = S.Element

    private(set) var first: Element?
    private var last: Element

    private var iterator: S.Iterator

    public
    mutating func next() -> Element? {
        guard let next = iterator.next() else {
            return nil
        }

        defer {
            last = next
        }

        return next - last
    }

    public
    init(_ sequance: S) {
        iterator = sequance.makeIterator()

        if let last = iterator.next() {
            first = last
            self.last = last
        } else {
            first = nil
            last = 0
        }
    }
}
