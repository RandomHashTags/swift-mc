
import MinecraftPackets

public protocol PacketReceiver: Sendable, ~Copyable {
    func sendPacket(_ packet: any Packet) throws
}
