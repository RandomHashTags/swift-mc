
public struct World: Sendable {

    /// The spawn location for this world.
    public var spawnLocation:Location

    /// Releative in-game time of this world.
    public var time:Int

    /// View distance used for this world.
    public var viewDistance:Int

    public var difficulty:Difficulty

    var flags:Flags.RawValue
}

// MARK: Flags
extension World {
    enum Flags: UInt16 {
        case animalsCanSpawn = 1
        case monstersCanSpawn = 2
        case pvpIsAllowed = 4
        case hasCeiling = 8
        case hasSkylight = 16
        case autoSaves = 32
        case bedWorks = 64
        case hardcore = 128
        case natural = 256
        case piglinSafe = 512
        case respawnAnchorWorks = 1024
    }
}