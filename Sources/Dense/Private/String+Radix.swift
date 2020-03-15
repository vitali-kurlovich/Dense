//
//  String+Radix.swift
//  Chart
//
//  Created by Vitali Kurlovich on 3/14/20.
//  Copyright © 2020 Vitali Kurlovich. All rights reserved.
//

import Foundation

internal enum Radix: Int {
    case binary = 2, octal = 8, decimal = 10, hex = 16

    /// Returns a radix's optional prefix
    var prefix: String {
        [.binary: "0b", .octal: "0o", .hex: "0x"][self, default: ""]
    }
}

internal
extension String.StringInterpolation {
    /// Represents a single numeric radix

    /// Return padded version of the value using a specified radix
    mutating func appendInterpolation<I: BinaryInteger>(_ value: I, radix: Radix, prefix: Bool = false, toWidth width: Int = 0) {
        // Values are uppercased, producing `FF` instead of `ff`
        var string = String(value, radix: radix.rawValue).uppercased()

        // Strings are pre-padded with 0 to match target widths
        if string.count < width {
            string = String(repeating: "0", count: max(0, width - string.count)) + string
        }

        // Prefixes use lower case, sourced from `String.StringInterpolation.Radix`
        if prefix {
            string = radix.prefix + string
        }

        appendInterpolation(string)
    }
}
