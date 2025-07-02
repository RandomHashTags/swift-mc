
public protocol Attribute: Nameable, MinecraftIdentifiable {
    var baseValue: Double { get }
    var description: String { get }
}