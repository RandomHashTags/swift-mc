
public protocol AttributeActiveProtocol: MinecraftIdentifiable {
    associatedtype Attribute: AttributeProtocol
    associatedtype Modifier: AttributeModifierProtocol

    var attribute: Attribute? { get }
    
    var baseValue: Double { get }
    var defaultValue: Double { get }
    var value: Double { get }

    var modifiers: [Modifier] { get } // TODO: make Set
}