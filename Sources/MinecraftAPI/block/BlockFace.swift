public protocol BlockFace: MinecraftIdentifiable {
    var direction: Vector { get }
    var alignment: Vector { get }
    var opposite: any BlockFace { get }
    var isCartesian: Bool { get }
}

/*
public extension BlockFace {
    private static func get(_ id: BlockFace.ID, oppositeID: BlockFace.ID) -> BlockFace {
        return BlockFace(id: "minecraft." + id, oppositeID: oppositeID)
    }

    static let none = get("none", oppositeID: "none")

    static let up = get("up", oppositeID: "down")
    static let down = get("down", oppositeID: "up")

    static let north = get("north", oppositeID: "south")
    static let south = get("south", oppositeID: "north")

    static let east = get("east", oppositeID: "west")
    static let west = get("west", oppositeID: "east")
}
*/