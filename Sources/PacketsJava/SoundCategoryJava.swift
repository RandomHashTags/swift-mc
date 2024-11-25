//
//  SoundCategoryJava.swift
//  
//
//  Created by Evan Anderson on 11/25/24.
//

import Packets

public enum SoundCategoryJava : String, SoundCategory, PacketEncodableMojangJava {
    case master
    case music
    case records
    case weather
    case blocks
    case hostile
    case neutral
    case players
    case ambient
    case voice

    public var id : String { "minecraft." + rawValue }

    public var packetID : Int {
        switch self {
            case .master: return 0
            case .music: return 1
            case .records: return 2
            case .weather: return 3
            case .blocks: return 4
            case .hostile: return 5
            case .neutral: return 6
            case .players: return 7
            case .ambient: return 8
            case .voice: return 9
        }
    }
}