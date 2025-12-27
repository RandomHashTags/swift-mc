
public struct ItemStack: Sendable {

    /// Number of items in this item stack.
    public var amount:Int

    /// Dictionary containing all enchantments and their levels on this item stack.
    public var enchantments:[Enchantment:Int]

    /// The `Material` of this item.
    public var material:Material

    /// The item's current meta.
    public var meta:ItemMeta?
}

// MARK: Enchantments
extension ItemStack {
    /// Removes all enchantments from this `ItemStack`.
    public mutating func removeEnchantments() {
        enchantments.removeAll(keepingCapacity: true)
    }
    
    /// - Returns: level of the specified enchantment on this item stack.
    public func enchantmentLevel(for enchantment: Enchantment) -> Int {
        return enchantments[enchantment] ?? 0
    }

    /// - Returns: Whether this item stack contains the given enchantment.
    public func contains(enchantment: Enchantment) -> Bool {
        return enchantments[enchantment] != nil
    }
}

// MARK: Is similar
extension ItemStack {
    /// - Returns: Whether the two item stacks are equal regardless of stack size (`amount`).
    public func isSimilar(to itemStack: ItemStack) -> Bool {
        return material == itemStack.material && enchantments == itemStack.enchantments
    }
}