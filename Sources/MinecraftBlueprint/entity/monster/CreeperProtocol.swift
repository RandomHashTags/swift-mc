
public protocol CreeperProtocol: MonsterProtocol, ~Copyable {
    /// Measured in blocks.
    var explosionRadius: Int { get }

    /// Measured in ticks.
    var fuseDuration: Int { get }

    /// Measured in ticks.
    var maxFuseDuration: Int { get }

    var igniter: (any EntityProtocol)? { get }

    var isCharged: Bool { get }

    func explode()

    func ignite<T: EntityProtocol>(
        igniter: inout T?
    )
}