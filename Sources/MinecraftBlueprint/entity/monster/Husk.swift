
public protocol Husk: Zombie, ~Copyable {
    /// Measured in ticks.
    var remainingConversionDuration: Int { get }
    var isConverting: Bool { get }
}

extension Husk {
    @inlinable
    public var isConverting: Bool {
        remainingConversionDuration > 0
    }
}