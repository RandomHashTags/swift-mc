
public protocol RecipeProtocol: MinecraftIdentifiable {
    /// The `ItemStack` crafted by this recipe.
    var result: any ItemStackProtocol { get }
}