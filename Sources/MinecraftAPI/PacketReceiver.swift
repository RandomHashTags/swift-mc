import MinecraftPackets

public protocol PacketReceiver {
    func sendPacket(_ packet: any Packet) throws
}
