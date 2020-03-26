//
//  DenseDeltaSequence.swift
//  Dense
//
//  Created by Vitali Kurlovich on 3/15/20.
//

import Foundation

/*

 public
 struct DenseSequence<T: SignedInteger & Codable>: Sequence {
 public typealias Element = T

 private let initial: T?
 private let buffer: DenseArray<T>

 public typealias Iterator = DenseSequenceIterator<T>

 public
 init<S: Sequence>(_ sequance: S) where S.Element ==
     Element {
     let deltaSequence = DeltaSequence(sequance)

     initial = deltaSequence.first
     buffer = DenseArray<Element>(deltaSequence)
 }

 public func makeIterator() -> Iterator {
     Iterator(bufferIterator: buffer.makeIterator(), initial: initial)
 }

 public var underestimatedCount: Int {
     buffer.count + 1
 }

 public
 var capacity: Int {
     buffer.capacity + 1
 }
 }

 public
 struct DenseSequenceIterator<T: SignedInteger & Codable>: IteratorProtocol {
 public typealias Element = T

 private var bufferIterator: DenseArray<T>.Iterator
 private var last: T?

 public mutating
 func next() -> T? {
     guard let current = last else {
         return nil
     }

     defer {
         if let next = bufferIterator.next() {
             last = current + next
         } else {
             last = nil
         }
     }

     return current
 }

 internal
 init(bufferIterator: DenseArray<T>.Iterator, initial: T?) {
     self.bufferIterator = bufferIterator
     last = initial
 }
 }

 */
