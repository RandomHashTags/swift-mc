
import MinecraftPackets

extension ServerPacket.Mojang.Java {
    public enum Login: UInt8, PacketGameplayID {
        case loginStart         = 0
        case encryptionResponse = 1
        case loginPluginResponse
        case loginAcknowledged

        @inlinable
        public var packet: any ServerPacketMojangJavaLoginProtocol.Type {
            switch self {
            case .loginStart:          ServerPacket.Mojang.Java.Login.LoginStart.self
            case .encryptionResponse:  ServerPacket.Mojang.Java.Login.EncryptionResponse.self
            case .loginPluginResponse: ServerPacket.Mojang.Java.Login.LoginPluginResponse.self
            case .loginAcknowledged:   ServerPacket.Mojang.Java.Login.LoginAcknowledged.self
            }
        }
    }
}
