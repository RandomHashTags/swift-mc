public protocol BlockFace: MinecraftIdentifiable {
    var direction: Vector { get }
    var alignment: Vector { get }
    var opposite: any BlockFace { get }
    var isCartesian: Bool { get }
}

/*
extension BlockFace {
    private static func get(_ id: BlockFace.ID, oppositeID: BlockFace.ID) -> BlockFace {
        return BlockFace(id: "minecraft." + id, oppositeID: oppositeID)
    }

    public static let none = get("none", oppositeID: "none")

    public static let up = get("up", oppositeID: "down")
    public static let down = get("down", oppositeID: "up")

    public static let north = get("north", oppositeID: "south")
    public static let south = get("south", oppositeID: "north")

    public static let east = get("east", oppositeID: "west")
    public static let west = get("west", oppositeID: "east")
}
*/