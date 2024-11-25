//
//  VariableIntegerJava.swift
//  
//
//  Created by Evan Anderson on 8/6/23.
//

/// An integer between -2147483648 and 2147483647.
///
/// Variable-length data encoding a two's complement signed 32-bit integer.
public struct VariableIntegerJava : Codable, PacketEncodableMojangJava, PacketDecodableMojangJava {
    public static func decode(from packet: GeneralPacketMojang) throws -> Self {
        return try packet.readVarInt()
    }
    
    public let value:Int32
    
    public var value_int : Int {
        return Int(value)
    }
    
    public init(value: Int32) {
        self.value = value
    }
    
    public func packetBytes() throws -> [UInt8] {
        return try value.packetBytes()
    }
}
