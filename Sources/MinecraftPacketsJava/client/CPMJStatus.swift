import MinecraftPackets

extension ClientPacket.Mojang.Java {
    public enum Status: UInt8, PacketGameplayID {
        case statusResponse = 0
        case pingResponse   = 1

        @inlinable
        public var packet: any ClientPacketMojangJavaStatusProtocol.Type {
            switch self {
            case .statusResponse: ClientPacket.Mojang.Java.Status.StatusResponse.self
            case .pingResponse:   ClientPacket.Mojang.Java.Status.PingResponse.self
            }
        }
    }
}
