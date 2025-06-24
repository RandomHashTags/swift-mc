//
//  SPMJStatus.swift
//  
//
//  Created by Evan Anderson on 8/4/23.
//

import MinecraftPackets

public extension ServerPacket.Mojang.Java {
    enum Status: UInt8, PacketGameplayID {
        case statusRequest = 0
        case pingRequest   = 1
        
        var packet: any ServerPacketMojangJavaStatusProtocol.Type {
            switch self {
            case .statusRequest: return ServerPacket.Mojang.Java.Status.StatusRequest.self
            case .pingRequest:   return ServerPacket.Mojang.Java.Status.PingRequest.self
            }
        }
    }
}
