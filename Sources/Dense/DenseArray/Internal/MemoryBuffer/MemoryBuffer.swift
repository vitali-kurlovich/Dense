//
//  MemoryBuffer.swift
//  Chart
//
//  Created by Vitali Kurlovich on 3/14/20.
//  Copyright © 2020 Vitali Kurlovich. All rights reserved.
//

import Foundation

internal
final class MemoryBuffer<T: BinaryInteger & Codable> {
    internal let buffer: UnsafeMutableBufferPointer<T>

    init(_ capacity: Int) {
        buffer = UnsafeMutableBufferPointer<T>.allocate(capacity: capacity)
    }

    deinit {
        buffer.deallocate()
    }

    subscript(position: Int) -> T {
        get {
            buffer[position]
        }
        set(value) {
            buffer[position] = value
        }
    }

    var count: Int {
        buffer.count
    }
}
