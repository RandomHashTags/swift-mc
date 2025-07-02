
public protocol PlayerProtocol: CommandSenderProtocol, Flyable, InventoryHolderProtocol, LivingEntityProtocol, Permissible, ~Copyable where Inventory: PlayerInventoryProtocol {    
    var listName: String? { get }
    
    var experience: UInt64 { get }
    var experienceLevel: UInt64 { get }    
    var foodLevel: Int { get }
    var saturationLevel: Float { get }
    var exhaustionLevel: Float { get }
    
    var statistics: [String: any StatisticActiveProtocol] { get }
    
    /// The current game mode of this player.
    var gameMode: any GameModeProtocol { get }
    var isBlocking: Bool { get }
    var isFlying: Bool { get }
    /// Whether or not this player is a server operator.
    var isOP: Bool { get }
    var isSneaking: Bool { get }
    var isSprinting: Bool { get }
    var lastSleptLocation: Location? { get }
    
    var inventory: Inventory { get }
    
    mutating func tickPlayer(
        _ server: any ServerProtocol
    )
    
    func setGameMode<T: GameModeProtocol>(
        _ gameMode: T
    )
    
    func ban(reason: String)
    func kick(reason: String)
    
    func consumed<T: ItemStackProtocol>(
        item: inout T
    )

    func sendChat(message: String)
}