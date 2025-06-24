public protocol Bee: Animal, Flyable {
    var angerLevel: Int { get }
    var remainingCannotEnterHiveDuration: Int { get }
    var hasNectar: Bool { get }
    var hasStung: Bool { get }
    var pathFindDestination: (any Location)? { get }
    var hiveLocation: (any Location)? { get }
}