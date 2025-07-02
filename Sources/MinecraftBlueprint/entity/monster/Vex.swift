
public protocol Vex: Monster, ~Copyable {
    var boundLocation: (any Location)? { get }
    /// Measured in ticks.
    var remainingLifespan: Int { get }
    var hasLimitedLifespan: Bool { get }
    var isCharging: Bool { get }
}