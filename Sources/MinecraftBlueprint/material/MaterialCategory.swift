
public protocol MaterialCategory: MinecraftIdentifiable, Nameable {
    var configuration: any MaterialConfiguration { get }
}