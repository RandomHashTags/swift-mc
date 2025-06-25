import MinecraftPackets

/// An integer/block position: x (-33554432 to 33554431), z (-33554432 to 33554431), y (-2048 to 2047).
///
/// x as a 26-bit integer, followed by z as a 26-bit integer, followed by y as a 12-bit integer (all signed, two's complement).
public struct PositionPacketMojang: Codable, PacketEncodableMojangJava, PacketDecodableMojangJava { // TODO: fix
    @inlinable
    public init() {
    }
    
    @inlinable
    public func packetBytes() throws -> [UInt8] { // TODO: fix
        return []
    }
}

// MARK: Decode
extension PositionPacketMojang {
    @inlinable
    public static func decode<T: GeneralPacket>(from packet: T) throws -> PositionPacketMojang { // TODO: fix
        return Self()
    }
}