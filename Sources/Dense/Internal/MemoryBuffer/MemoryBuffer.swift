//
//  MemoryBuffer.swift
//  Chart
//
//  Created by Vitali Kurlovich on 3/14/20.
//  Copyright © 2020 Vitali Kurlovich. All rights reserved.
//

import Foundation

internal
final class MemoryBuffer<Element: BinaryInteger & Codable> {
    internal let buffer: UnsafeMutableBufferPointer<Element>

    init(_ capacity: Int) {
        buffer = UnsafeMutableBufferPointer<Element>.allocate(capacity: capacity)
    }

    deinit {
        buffer.deallocate()
    }

    subscript(position: Int) -> Element {
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
