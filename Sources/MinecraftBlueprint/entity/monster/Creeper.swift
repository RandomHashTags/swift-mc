
public protocol Creeper: Monster, ~Copyable {
    /// Measured in blocks.
    var explosionRadius: Int { get }

    /// Measured in ticks.
    var fuseDuration: Int { get }

    /// Measured in ticks.
    var maxFuseDuration: Int { get }

    var igniter: (any Entity)? { get }

    var isCharged: Bool { get }

    func explode()
    func ignite(igniter: (any Entity)?)
}