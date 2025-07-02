
public protocol ZombieProtocol: Ageable, MonsterProtocol , ~Copyable{
    var canBreakDoors: Bool { get }
    /// Measured in ticks.
    var remainingConversionDuration: Int { get }
    var isConverting: Bool { get }
}

extension ZombieProtocol {
    @inlinable
    public var isConverting: Bool {
        remainingConversionDuration > 0
    }
}