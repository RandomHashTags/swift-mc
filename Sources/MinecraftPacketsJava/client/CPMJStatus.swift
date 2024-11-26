//
//  CPMJStatus.swift
//  
//
//  Created by Evan Anderson on 8/4/23.
//

import MinecraftPackets

public extension ClientPacket.Mojang.Java {
    enum Status : UInt8, PacketGameplayID {
        case statusResponse = 0
        case pingResponse   = 1
        
        var packet : any ClientPacketMojangJavaStatusProtocol.Type {
            switch self {
            case .statusResponse: return ClientPacket.Mojang.Java.Status.StatusResponse.self
            case .pingResponse:   return ClientPacket.Mojang.Java.Status.PingResponse.self
            }
        }
    }
}
