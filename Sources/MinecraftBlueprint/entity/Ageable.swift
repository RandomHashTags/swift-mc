public protocol Ageable: Creature {
    /// Measured in ticks.
    var age: Int { get }
    var isAdult: Bool { get }
}