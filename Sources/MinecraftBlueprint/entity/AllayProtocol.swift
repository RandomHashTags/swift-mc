
public protocol AllayProtocol: CreatureProtocol, Flyable, InventoryHolderProtocol, ~Copyable {    
    var inventory: Inventory { get }

    var canDuplicate: Bool { get }
    /// Measured in ticks.
    var duplicationCooldown: Int { get }

    var isDancing: Bool { get }
    var dancingSourceLocation: Location? { get }
}