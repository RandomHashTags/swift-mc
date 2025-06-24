//
//  CPMJConfiguration.swift
//
//
//  Created by Evan Anderson on 11/15/23.
//

import MinecraftPackets

public extension ClientPacket.Mojang.Java {
    enum Configuration: UInt8, PacketGameplayID {
        case pluginMessage
        case disconnect
        case finishConfiguration
        case keepAlive
        case ping
        case registryData
        case resourcePack
        case featureFlags
        case updateTags
        
        var packet: any ClientPacket.Mojang.Java.ConfigurationProtocol.Type {
            switch self {
            case .pluginMessage:       return ClientPacket.Mojang.Java.Configuration.PluginMessage.self
            case .disconnect:           return ClientPacket.Mojang.Java.Configuration.Disconnect.self
            case .finishConfiguration: return ClientPacket.Mojang.Java.Configuration.FinishConfiguration.self
            case .keepAlive:           return ClientPacket.Mojang.Java.Configuration.KeepAlive.self
            case .ping:                 return ClientPacket.Mojang.Java.Configuration.Ping.self
            case .registryData:        return ClientPacket.Mojang.Java.Configuration.RegistryData.self
            case .resourcePack:        return ClientPacket.Mojang.Java.Configuration.ResourcePack.self
            case .featureFlags:        return ClientPacket.Mojang.Java.Configuration.FeatureFlags.self
            case .updateTags:          return ClientPacket.Mojang.Java.Configuration.UpdateTags.self
            }
        }
    }
}
