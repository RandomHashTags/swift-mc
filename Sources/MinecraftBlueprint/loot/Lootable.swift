
public protocol Lootable: Sendable, ~Copyable {
    var seed: Int { get }
    var lootTable: (any LootTableProtocol)? { get }
}