
public protocol BeeProtocol: AnimalProtocol, Flyable, ~Copyable {
    var angerLevel: Int { get }
    var remainingCannotEnterHiveDuration: Int { get }
    var hasNectar: Bool { get }
    var hasStung: Bool { get }
    var pathFindDestination: Location? { get }
    var hiveLocation: Location? { get }
}