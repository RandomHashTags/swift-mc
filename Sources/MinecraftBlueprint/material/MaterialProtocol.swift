
public protocol MaterialProtocol: MinecraftIdentifiable, Nameable {
    var categories: [any MaterialCategoryProtocol] { get }
    var configuration: any MaterialConfigurationProtocol { get }
    var recipe: (any RecipeProtocol)? { get }
}