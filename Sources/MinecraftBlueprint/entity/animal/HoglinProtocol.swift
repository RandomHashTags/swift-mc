
public protocol HoglinProtocol: AnimalProtocol, HostileProtocol {
    /// Measured in ticks.
    var remainingConversionTime: Int { get }

    var isConverting: Bool { get }
    var isHuntable: Bool { get }
    var isImmuneToZombification: Bool { get }
}

extension HoglinProtocol {
    @inlinable
    public var isConverting: Bool {
        remainingConversionTime > 0
    }
}