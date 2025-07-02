
public protocol MaterialCategoryProtocol: MinecraftIdentifiable, Nameable {
    associatedtype Configuration: MaterialConfigurationProtocol

    var configuration: Configuration { get }
}