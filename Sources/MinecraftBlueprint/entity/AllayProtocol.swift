
public protocol AllayProtocol: CreatureProtocol, Flyable, InventoryHolderProtocol, ~Copyable {
    var inventory: any InventoryProtocol { get }

    var canDuplicate: Bool { get }
    /// Measured in ticks.
    var duplicationCooldown: Int { get }

    var isDancing: Bool { get }
    var dancingSourceLocation: (any LocationProtocol)? { get }
}