
public protocol MaterialProtocol: MinecraftIdentifiable, Nameable {
    associatedtype Category: MaterialCategoryProtocol
    associatedtype Configuration: MaterialConfigurationProtocol
    associatedtype Recipe: RecipeProtocol

    var categories: [Category] { get }
    var configuration: Configuration { get }
    var recipe: Recipe? { get }
}