
import MinecraftPackets

extension ServerPacket.Mojang.Java {
    public enum Handshaking: UInt8, PacketGameplayID {
        case handshake = 0
        case legacyServerListPing = 254

        @inlinable
        public var packet: any ServerPacketMojangJavaHandshakingProtocol.Type {
            switch self {
            case .handshake:            ServerPacket.Mojang.Java.Handshaking.Handshake.self
            case .legacyServerListPing: ServerPacket.Mojang.Java.Handshaking.LegacyServerListPing.self
            }
        }
    }
}
