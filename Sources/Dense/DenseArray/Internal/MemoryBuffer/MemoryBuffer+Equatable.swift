//
//  MemoryBuffer+Equatable.swift
//  Dense
//
//  Created by Vitali Kurlovich on 3/16/20.
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
