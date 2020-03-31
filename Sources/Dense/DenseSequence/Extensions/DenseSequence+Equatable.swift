//
//  DenseSequence+Equatable.swift
//  Dense
//
//  Created by Vitali Kurlovich on 3/27/20.
//

import Foundation

extension DenseSequence: Equatable {
    public static func == (lhs: DenseSequence<T>, rhs: DenseSequence<T>) -> Bool {
        lhs.initial == rhs.initial && lhs.buffer == rhs.buffer
    }
}
