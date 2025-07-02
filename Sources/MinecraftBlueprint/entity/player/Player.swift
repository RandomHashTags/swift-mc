
public protocol Player: CommandSender, Flyable, InventoryHolder, LivingEntity, Permissible, ~Copyable {
    var listName: String? { get }
    
    var experience: UInt64 { get }
    var experienceLevel: UInt64 { get }    
    var foodLevel: Int { get }
    var saturationLevel: Float { get }
    var exhaustionLevel: Float { get }
    
    var statistics: [String: any StatisticActive] { get }
    
    /// The current game mode of this player.
    var gameMode: any GameMode { get }
    var isBlocking: Bool { get }
    var isFlying: Bool { get }
    /// Whether or not this player is a server operator.
    var isOP: Bool { get }
    var isSneaking: Bool { get }
    var isSprinting: Bool { get }
    var lastSleptLocation: (any Location)? { get }
    
    var inventory: any PlayerInventory { get }
    
    mutating func tickPlayer(_ server: any Server)
    
    func setGameMode(_ gameMode: any GameMode)
    
    func ban(reason: String)
    func kick(reason: String)
    
    func consumed(item: inout any ItemStack)

    func sendChat(message: String)
}