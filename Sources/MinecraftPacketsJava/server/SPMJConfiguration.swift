
import MinecraftPackets

extension ServerPacket.Mojang.Java {
    public enum Configuration: UInt8, PacketGameplayID {
        case clientInformation
        case pluginMessage
        case finishConfiguration
        case keepAlive
        case pong
        case resourcePackResponse

        @inlinable
        public var packet: any ServerPacketMojangJavaConfigurationProtocol.Type {
            switch self {
            case .clientInformation:    ServerPacket.Mojang.Java.Configuration.ClientInformation.self
            case .pluginMessage:        ServerPacket.Mojang.Java.Configuration.PluginMessage.self
            case .finishConfiguration:  ServerPacket.Mojang.Java.Configuration.FinishConfiguration.self
            case .keepAlive:            ServerPacket.Mojang.Java.Configuration.KeepAlive.self
            case .pong:                 ServerPacket.Mojang.Java.Configuration.Pong.self
            case .resourcePackResponse: ServerPacket.Mojang.Java.Configuration.ResourcePackResponse.self
            }
        }
    }
}
