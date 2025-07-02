
public protocol LootTableEntryProtocol: Sendable, ~Copyable {
    var item: any ItemStackProtocol { get }
    var amountMin: Int { get }
    var amountMax: Int { get }
    var chance: UInt8 { get }
}