public protocol Recipe: MinecraftIdentifiable {
    /// The `ItemStack` crafted by this recipe.
    var result: any ItemStack { get }
}