import MinecraftPackets

/// An integer between -2147483648 and 2147483647.
///
/// Variable-length data encoding a two's complement signed 32-bit integer.
public struct VariableIntegerJava: Hashable, VariableInteger, PacketEncodableMojangJava, PacketDecodableMojangJava {
    public let value:Int32

    @inlinable
    public init(value: Int32) {
        self.value = value
    }

    @inlinable
    public var valueInt: Int {
        return Int(value)
    }

    @inlinable
    public func packetBytes() throws -> [UInt8] {
        return try value.packetBytes()
    }
}

// MARK: Decode
extension VariableIntegerJava {
    @inlinable
    public static func decode<T: GeneralPacket>(from packet: T) throws -> Self {
        try packet.readVarInt()
    }
}