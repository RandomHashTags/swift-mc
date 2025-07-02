
public protocol LootTableProtocol: Sendable, ~Copyable {
    associatedtype Entry: LootTableEntryProtocol

    var entries: [Entry] { get }
}
/*
extension LootTable {
    /// - Complexity: O(_n_)
    @inlinable
    public func lootNormal() -> [any ItemStack]? {
        let loot:[any ItemStack] = entries.compactMap({ entry in
            let chance:UInt8 = UInt8.random(in: 0..<100)
            guard chance <= entry.chance else { return nil }
            var item:any ItemStack = entry.item
            item.amount = Int.random(in: entry.amountMin...entry.amountMax)
            return item
        })
        return loot.isEmpty ? nil : loot
    }
}
*/