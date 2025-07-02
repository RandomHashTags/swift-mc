
public protocol LootTableEntryProtocol: Sendable, ~Copyable {
    associatedtype ItemStack: ItemStackProtocol

    var item: ItemStack { get }
    var amountMin: Int { get }
    var amountMax: Int { get }
    var chance: UInt8 { get }
}