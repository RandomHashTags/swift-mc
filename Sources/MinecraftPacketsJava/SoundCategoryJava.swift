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

    @inlinable
    public var id: ID {
        switch self {
        case .master:  #identifiable("minecraft.master")
        case .music:   #identifiable("minecraft.music")
        case .records: #identifiable("minecraft.records")
        case .weather: #identifiable("minecraft.weather")
        case .blocks:  #identifiable("minecraft.blocks")
        case .hostile: #identifiable("minecraft.hostile")
        case .neutral: #identifiable("minecraft.neutral")
        case .players: #identifiable("minecraft.players")
        case .ambient: #identifiable("minecraft.ambient")
        case .voice:   #identifiable("minecraft.voice")
        }
    }

    @inlinable
    public var packetID: Int {
        rawValue
    }
}