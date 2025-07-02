
public protocol Ageable: CreatureProtocol, ~Copyable {
    /// Measured in ticks.
    var age: Int { get }
    var isAdult: Bool { get }
}