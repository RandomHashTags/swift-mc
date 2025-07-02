
import MinecraftPackets

public protocol PacketDecodableMojangJava: PacketDecodable, ~Copyable {
    func packetBytes() throws -> [UInt8]
}
