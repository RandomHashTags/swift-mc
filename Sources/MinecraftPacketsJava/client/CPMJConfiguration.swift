
import MinecraftPackets

extension ClientPacket.Mojang.Java {
    public enum Configuration: UInt8, PacketGameplayID {
        case pluginMessage
        case disconnect
        case finishConfiguration
        case keepAlive
        case ping
        case registryData
        case resourcePack
        case featureFlags
        case updateTags

        @inlinable
        public var packet: any ClientPacket.Mojang.Java.ConfigurationProtocol.Type {
            switch self {
            case .pluginMessage:       ClientPacket.Mojang.Java.Configuration.PluginMessage.self
            case .disconnect:          ClientPacket.Mojang.Java.Configuration.Disconnect.self
            case .finishConfiguration: ClientPacket.Mojang.Java.Configuration.FinishConfiguration.self
            case .keepAlive:           ClientPacket.Mojang.Java.Configuration.KeepAlive.self
            case .ping:                ClientPacket.Mojang.Java.Configuration.Ping.self
            case .registryData:        ClientPacket.Mojang.Java.Configuration.RegistryData.self
            case .resourcePack:        ClientPacket.Mojang.Java.Configuration.ResourcePack.self
            case .featureFlags:        ClientPacket.Mojang.Java.Configuration.FeatureFlags.self
            case .updateTags:          ClientPacket.Mojang.Java.Configuration.UpdateTags.self
            }
        }
    }
}
