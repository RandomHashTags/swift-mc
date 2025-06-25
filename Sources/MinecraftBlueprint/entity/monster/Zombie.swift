public protocol Zombie: Ageable, Monster {
    var canBreakDoors: Bool { get }
    /// Measured in ticks.
    var remainingConversionDuration: Int { get }
    var isConverting: Bool { get }
}

extension Zombie {
    @inlinable
    public var isConverting: Bool {
        remainingConversionDuration > 0
    }
}