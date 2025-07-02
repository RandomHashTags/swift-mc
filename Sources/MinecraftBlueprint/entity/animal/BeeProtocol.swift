
public protocol BeeProtocol: AnimalProtocol, Flyable, ~Copyable {
    var angerLevel: Int { get }
    var remainingCannotEnterHiveDuration: Int { get }
    var hasNectar: Bool { get }
    var hasStung: Bool { get }
    var pathFindDestination: (any LocationProtocol)? { get }
    var hiveLocation: (any LocationProtocol)? { get }
}