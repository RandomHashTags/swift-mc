
public protocol Ageable: Creature, ~Copyable {
    /// Measured in ticks.
    var age: Int { get }
    var isAdult: Bool { get }
}