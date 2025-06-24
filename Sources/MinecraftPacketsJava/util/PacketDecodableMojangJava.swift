import MinecraftPackets

public protocol PacketDecodableMojangJava: PacketDecodable {
    func packetBytes() throws -> [UInt8]
}
