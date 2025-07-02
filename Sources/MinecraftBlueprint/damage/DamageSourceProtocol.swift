
public protocol DamageSourceProtocol: Sendable, ~Copyable {
    associatedtype DamageType: DamageTypeProtocol
    associatedtype Location: LocationProtocol

    var type: DamageType { get }

    /// The `Entity` that inflicted the damage.
    var entity: (any EntityProtocol)? { get }

    /// The `Entity` that threw/shot the `entity`.
    var sourceEntity: (any EntityProtocol)? { get }

    /// The `sourceEntity`'s location when they shot/threw the `entity`.
    var sourceEntityLocation: Location? { get }

    /// Where the damage originated from.
    var location: Location? { get }

    var foodExhaustion: Float { get }
    var scalesWithDifficulty: Bool { get }
}