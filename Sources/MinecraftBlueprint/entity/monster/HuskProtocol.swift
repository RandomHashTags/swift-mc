
public protocol HuskProtocol: ZombieProtocol, ~Copyable {
    /// Measured in ticks.
    var remainingConversionDuration: Int { get }
    var isConverting: Bool { get }
}

extension HuskProtocol {
    @inlinable
    public var isConverting: Bool {
        remainingConversionDuration > 0
    }
}