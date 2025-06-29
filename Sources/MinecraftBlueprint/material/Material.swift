public protocol Material: MinecraftIdentifiable, Nameable {
    var categories: [any MaterialCategory] { get }
    var configuration: any MaterialConfiguration { get }
    var recipe: (any Recipe)? { get }
}