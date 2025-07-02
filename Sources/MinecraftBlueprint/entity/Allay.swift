
public protocol Allay: Creature, Flyable, InventoryHolder, ~Copyable {
    var inventory: any Inventory { get }

    var canDuplicate: Bool { get }
    /// Measured in ticks.
    var duplicationCooldown: Int { get }

    var isDancing: Bool { get }
    var dancingSourceLocation: (any Location)? { get }
}