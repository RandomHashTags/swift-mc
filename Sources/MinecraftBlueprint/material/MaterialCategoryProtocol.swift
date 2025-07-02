
public protocol MaterialCategoryProtocol: MinecraftIdentifiable, Nameable {
    var configuration: any MaterialConfigurationProtocol { get }
}