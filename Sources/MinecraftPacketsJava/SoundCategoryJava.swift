import MinecraftPackets

public enum SoundCategoryJava: Int, SoundCategory, PacketEncodableMojangJava {
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

    public var id: ID {
        switch self {
            case .master:  return #identifiable("minecraft.master")
            case .music:   return #identifiable("minecraft.music")
            case .records: return #identifiable("minecraft.records")
            case .weather: return #identifiable("minecraft.weather")
            case .blocks:  return #identifiable("minecraft.blocks")
            case .hostile: return #identifiable("minecraft.hostile")
            case .neutral: return #identifiable("minecraft.neutral")
            case .players: return #identifiable("minecraft.players")
            case .ambient: return #identifiable("minecraft.ambient")
            case .voice:   return #identifiable("minecraft.voice")
        }
    }

    public var packetID: Int { rawValue }
}