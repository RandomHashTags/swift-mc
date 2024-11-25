//
//  VariableLongJava.swift
//  
//
//  Created by Evan Anderson on 8/8/23.
//

/// An integer between -9223372036854775808 and 9223372036854775807.
///
/// Variable-length data encoding a two's complement signed 64-bit integer.
public struct VariableLongJava : Codable, PacketEncodableMojangJava {
    public let value:Int64
    
    public init(value: Int64) {
        self.value = value
    }
    
    public func packetBytes() throws -> [UInt8] {
        return try value.packetBytes()
    }
}
