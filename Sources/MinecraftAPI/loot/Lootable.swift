public protocol Lootable {
    var seed: Int { get }
    var lootTable: (any LootTable)? { get }
}