
public protocol DamageSourceProtocol: Sendable, ~Copyable {
    var type: any DamageTypeProtocol { get }

    /// The `Entity` that inflicted the damage.
    var entity: (any EntityProtocol)? { get }

    /// The `Entity` that threw/shot the `entity`.
    var sourceEntity: (any EntityProtocol)? { get }

    /// The `sourceEntity`'s location when they shot/threw the `entity`.
    var sourceEntityLocation: (any LocationProtocol)? { get }

    /// Where the damage originated from.
    var location: (any LocationProtocol)? { get }

    var foodExhaustion: Float { get }
    var scalesWithDifficulty: Bool { get }
}