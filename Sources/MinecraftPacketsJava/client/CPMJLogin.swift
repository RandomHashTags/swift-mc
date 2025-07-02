
import MinecraftPackets

extension ClientPacket.Mojang.Java {
    public enum Login: UInt8, PacketGameplayID {
        case disconnect = 0
        case encryptionRequest = 1
        case loginSuccess
        case setCompression
        case loginPluginRequest
        
        @inlinable
        public var packet: any ClientPacketMojangJavaProtocol.Type {
            switch self {
            case .disconnect:          ClientPacket.Mojang.Java.Login.Disconnect.self
            case .encryptionRequest:   ClientPacket.Mojang.Java.Login.EncryptionRequest.self
            case .loginSuccess:        ClientPacket.Mojang.Java.Login.LoginSuccess.self
            case .setCompression:      ClientPacket.Mojang.Java.Login.SetCompression.self
            case .loginPluginRequest:  ClientPacket.Mojang.Java.Login.LoginPluginRequest.self
            }
        }
    }
}
