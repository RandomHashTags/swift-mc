
public protocol VexProtocol: MonsterProtocol, ~Copyable {
    var boundLocation: (any LocationProtocol)? { get }
    /// Measured in ticks.
    var remainingLifespan: Int { get }
    var hasLimitedLifespan: Bool { get }
    var isCharging: Bool { get }
}