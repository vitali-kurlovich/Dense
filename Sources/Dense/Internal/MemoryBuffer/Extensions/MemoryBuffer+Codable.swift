//
//  MemoryBuffer+Encodable.swift
//  Dense
//
//  Created by Vitali Kurlovich on 3/16/20.
//

import Foundation

extension MemoryBuffer: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(buffer.count)
        try container.encode(contentsOf: buffer)
    }
}

extension MemoryBuffer: Decodable {
    public convenience init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        let count = try container.decode(Int.self)

        self.init(count)

        for index in 0 ..< count {
            self[index] = try container.decode(Element.self)
        }
    }
}
