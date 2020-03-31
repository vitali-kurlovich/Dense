//
//  DenseSequence+Codable.swift
//  Dense
//
//  Created by Vitali Kurlovich on 3/27/20.
//

import Foundation

extension DenseSequence: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        if let initial = initial {
            try container.encode(true)
            try container.encode(initial)
            try container.encode(buffer)
        } else {
            try container.encode(false)
        }
    }
}

extension DenseSequence: Decodable {
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()

        if try container.decode(Bool.self) {
            let initial = try container.decode(T.self)
            let buffer = try container.decode(DenseArray<T>.self)
            self.init(initial: initial, buffer: buffer)
        } else {
            self.init()
        }
    }
}
