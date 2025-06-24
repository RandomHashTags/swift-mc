import MinecraftPackets

public extension ClientPacket.Mojang.Java {
    enum Login: UInt8, PacketGameplayID {
        case disconnect = 0
        case encryptionRequest = 1
        case loginSuccess
        case setCompression
        case loginPluginRequest
        
        var packet: any ClientPacketMojangJavaProtocol.Type {
            switch self {
            case .disconnect:           return ClientPacket.Mojang.Java.Login.Disconnect.self
            case .encryptionRequest:   return ClientPacket.Mojang.Java.Login.EncryptionRequest.self
            case .loginSuccess:        return ClientPacket.Mojang.Java.Login.LoginSuccess.self
            case .setCompression:      return ClientPacket.Mojang.Java.Login.SetCompression.self
            case .loginPluginRequest: return ClientPacket.Mojang.Java.Login.LoginPluginRequest.self
            }
        }
    }
}
