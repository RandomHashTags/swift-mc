//
//  SoundCategoryJava.swift
//  
//
//  Created by Evan Anderson on 11/25/24.
//

import MinecraftPackets

public enum SoundCategoryJava : Int, SoundCategory, PacketEncodableMojangJava {
    case master = 0
    case music
    case records
    case weather
    case blocks
    case hostile
    case neutral
    case players
    case ambient
    case voice

    public var id : String { "minecraft." + String(describing: self) }

    public var packetID : Int { rawValue }
}