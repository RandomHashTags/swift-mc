//
//  ServerPacketMojangJavaConfiguration.swift
//  
//
//  Created by Evan Anderson on 11/15/23.
//

import Packets

extension ServerPacket.Mojang.Java {
    enum Configuration : UInt8, PacketGameplayID {
        case clientInformation
        case pluginMessage
        case finishConfiguration
        case keepAlive
        case pong
        case resourcePackResponse
        
        var packet : any ServerPacketMojangJavaConfigurationProtocol.Type {
            switch self {
            case .clientInformation:     return ServerPacket.Mojang.Java.Configuration.ClientInformation.self
            case .pluginMessage:         return ServerPacket.Mojang.Java.Configuration.PluginMessage.self
            case .finishConfiguration:   return ServerPacket.Mojang.Java.Configuration.FinishConfiguration.self
            case .keepAlive:             return ServerPacket.Mojang.Java.Configuration.KeepAlive.self
            case .pong:                   return ServerPacket.Mojang.Java.Configuration.Pong.self
            case .resourcePackResponse: return ServerPacket.Mojang.Java.Configuration.ResourcePackResponse.self
            }
        }
    }
}
