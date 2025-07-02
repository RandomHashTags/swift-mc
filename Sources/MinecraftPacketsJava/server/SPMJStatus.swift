
import MinecraftPackets

extension ServerPacket.Mojang.Java {
    public enum Status: UInt8, PacketGameplayID {
        case statusRequest = 0
        case pingRequest   = 1

        @inlinable
        public var packet: any ServerPacketMojangJavaStatusProtocol.Type {
            switch self {
            case .statusRequest: ServerPacket.Mojang.Java.Status.StatusRequest.self
            case .pingRequest:   ServerPacket.Mojang.Java.Status.PingRequest.self
            }
        }
    }
}
