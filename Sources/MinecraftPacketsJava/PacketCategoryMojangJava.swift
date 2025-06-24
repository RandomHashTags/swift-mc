//
//  PacketCategoryMojangJava.swift
//  
//
//  Created by Evan Anderson on 8/4/23.
//

import MinecraftPackets

public enum PacketCategoryMojangJava: PacketCategory {
    case clientHandshaking
    case clientLogin
    case clientConfiguration
    case clientPlay
    case clientStatus
    
    case serverHandshaking
    case serverLogin
    case serverConfiguration
    case serverPlay
    case serverStatus
    
    /// the associated packet is meant to be a placeholder for something
    case middleware
}
