
public protocol RecipeProtocol: MinecraftIdentifiable {
    associatedtype ItemStack: ItemStackProtocol

    /// The `ItemStack` crafted by this recipe.
    var result: ItemStack { get }
}