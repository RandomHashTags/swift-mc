
/// A source of damage.
public struct DamageSource: Sendable {

    /// Location where the damage originates.
    public let damageLocation:Location?

    /// Amount of hunger exhaustion caused by this damage.
    public let foodExhaustion:Float

    var flags:Flags.RawValue
}

// MARK: Flags
extension DamageSource {
    enum Flags: UInt8, Sendable {
        case indirect = 1
        case scalesWithDifficulty = 2
    }

    private func isFlag(_ flag: Flags) -> Bool {
        flags & flag.rawValue > 0
    }

    /// If this source of damage is indirect.
    public var isIndirect: Bool {
        isFlag(.indirect)
    }

    /// If this source of damage scales with difficulty.
    public var scalesWithDifficulty: Bool {
        isFlag(.scalesWithDifficulty)
    }
}

// MARK: Source location
extension DamageSource {
    /// Location where the damage originates, taking into account the causing entity.
    public var sourceLocation: Location? {
        damageLocation // TODO: fix
    }
}