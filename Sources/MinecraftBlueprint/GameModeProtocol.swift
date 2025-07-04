
public protocol GameModeProtocol: MinecraftIdentifiable, Nameable {
    /// The `InventoryClickType` identifiers not allowed for this game mode.
    //var disallowedInventoryClickTypes: Set<String> { get }

    var allowsFlight: Bool { get }

    var canBreakBlocks: Bool { get }
    var canBreatheUnderwater: Bool { get }
    var canPickupItems: Bool { get }
    var canPlaceBlocks: Bool { get }

    var isAffectedByGravity: Bool { get }
    var isDamageable: Bool { get }
    var isInvisible: Bool { get }
    
    var losesHunger: Bool { get }
}