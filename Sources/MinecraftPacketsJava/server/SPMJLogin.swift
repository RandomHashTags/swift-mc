//
//  SPMJLogin.swift
//
//
//  Created by Evan Anderson on 11/6/23.
//

import MinecraftPackets

public extension ServerPacket.Mojang.Java {
    enum Login : UInt8, PacketGameplayID {
        case loginStart         = 0
        case encryptionResponse = 1
        case loginPluginResponse
        case loginAcknowledged
        
        var packet : any ServerPacketMojangJavaLoginProtocol.Type {
            switch self {
            case .loginStart:           return ServerPacket.Mojang.Java.Login.LoginStart.self
            case .encryptionResponse:   return ServerPacket.Mojang.Java.Login.EncryptionResponse.self
            case .loginPluginResponse: return ServerPacket.Mojang.Java.Login.LoginPluginResponse.self
            case .loginAcknowledged:    return ServerPacket.Mojang.Java.Login.LoginAcknowledged.self
            }
        }
    }
}
