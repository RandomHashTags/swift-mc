public protocol Hoglin: Animal, Hostile {
    /// Measured in ticks.
    var remainingConversionTime: Int { get }

    var isConverting: Bool { get }
    var isHuntable: Bool { get }
    var isImmuneToZombification: Bool { get }
}

extension Hoglin {
    @inlinable
    public var isConverting: Bool {
        remainingConversionTime > 0
    }
}