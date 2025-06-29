
public protocol LootTableEntry {
    var item: any ItemStack { get }
    var amountMin: Int { get }
    var amountMax: Int { get }
    var chance: UInt8 { get }
}
