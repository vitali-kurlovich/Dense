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
