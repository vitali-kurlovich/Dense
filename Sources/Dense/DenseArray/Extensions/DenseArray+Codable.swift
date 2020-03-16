//
//  DenseArray+Codable.swift
//  Dense
//
//  Created by Vitali Kurlovich on 3/16/20.
//

import Foundation

extension DenseArray: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        if let min = _min, let max = _max {
            try container.encode(multiplier)
            try container.encode(min)
            try container.encode(max)
            try buffer.encode(to: encoder)
        } else {
            try container.encode(0)
        }
    }
}
