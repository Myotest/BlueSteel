//
//  AvroEncoder.swift
//  BlueSteel
//
//  Created by Matt Isaacs.
//  Copyright (c) 2014 Gilt. All rights reserved.
//

import Foundation

open class AvroEncoder {

    public var bytes: [UInt8] = []

    func encodeNull() {
        return
    }

    public func encodeBoolean(_ value: Bool) {
        if value {
            bytes.append(UInt8(0x1))
        } else {
            bytes.append(UInt8(0x0))
        }
        return
    }

    public func encodeInt(_ value: Int32) {
        let encoded = Varint(fromValue: Int64(value).encodeZigZag())
        bytes += encoded.backing
        return
    }

    public func encodeLong(_ value: Int64) {
        let encoded = Varint(fromValue: value.encodeZigZag())
        bytes += encoded.backing
        return
    }
    
    public func encodeFloat(_ value: Float) {
        let bits = value.bitPattern

        let encodedFloat: [UInt8] = [UInt8(0xff & bits),
            UInt8(0xff & (bits >> 8)),
            UInt8(0xff & (bits >> 16)),
            UInt8(0xff & (bits >> 24))]

        bytes += encodedFloat
        return
    }
    
    public func encodeDouble(_ value: Double) {
        let bits = value.bitPattern

        let encodedDouble: [UInt8] = [UInt8(0xff & bits),
            UInt8(0xff & (bits >> 8)),
            UInt8(0xff & (bits >> 16)),
            UInt8(0xff & (bits >> 24)),
            UInt8(0xff & (bits >> 32)),
            UInt8(0xff & (bits >> 40)),
            UInt8(0xff & (bits >> 48)),
            UInt8(0xff & (bits >> 56))]
        bytes += encodedDouble
        return
    }

    public func encodeString(_ value: String) {
        encodeBytes([UInt8](value.utf8))
    }

    public func encodeBytes(_ value: [UInt8]) {
        encodeLong(Int64(value.count))
        bytes += value
        return
    }

    public func encodeFixed(_ value: [UInt8]) {
        bytes += value
        return
    }

    public init() {
        bytes = []
    }
}
