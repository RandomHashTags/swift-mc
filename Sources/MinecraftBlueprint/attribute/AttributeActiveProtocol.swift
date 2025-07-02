
public protocol AttributeActiveProtocol: MinecraftIdentifiable {
    var attribute: (any AttributeProtocol)? { get }
    
    var baseValue: Double { get }
    var defaultValue: Double { get }
    var value: Double { get }

    var modifiers: [any AttributeModifierProtocol] { get } // TODO: make Set
}