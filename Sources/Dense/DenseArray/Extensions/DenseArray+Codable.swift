//
//  DenseArray+Codable.swift
//  Dense
//
//  Created by Vitali Kurlovich on 3/16/20.
//

import Foundation

extension DenseArray: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()

        if let min = _min, let max = _max {
            try container.encode(count)
            try container.encode(multiplier)
            try container.encode(min)
            try container.encode(max)

            try container.encode(buffer)

        } else {
            try container.encode(count)
        }
    }
}

extension DenseArray: Decodable {
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        let count = try container.decode(Int.self)
        if count > 0 {
            let multiplier = try container.decode(T.self)
            let min = try container.decode(T.self)
            let max = try container.decode(T.self)
            let buffer = try container.decode(MemoryBuffer<T>.self)

            self.init(buffer, min: min, max: max, multiplier: multiplier, count: count)
        } else {
            self.init(MemoryBuffer<T>(0), min: nil, max: nil, multiplier: 0, count: 0)
        }
    }
}
