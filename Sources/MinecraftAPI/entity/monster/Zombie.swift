public protocol Zombie: Ageable, Monster {
    var canBreakDoors: Bool { get }
    /// Measured in ticks.
    var remainingConversionDuration: Int { get }
    var isConverting: Bool { get }
}

public extension Zombie {
    var isConverting: Bool { remainingConversionDuration > 0 }
}