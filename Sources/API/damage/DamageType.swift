
public struct DamageType: Sendable {
    public let id:String

    /// Amount of hunger exhaustion caused by this damage type.
    public let exhaustion:Float

    /// The `DamageEffect` for this damage type.
    public let damageEffect:DamageEffect

    /// The `DeathMessageType` for this damage type.
    public let deathMessageType:DeathMessageType
}

// MARK: Create
extension DamageType {
    // TODO: fix default values
    public static func create(
        _ id: String,
        exhaustion: Float = 0,
        damageEffect: DamageEffect = .hurt,
        deathMessageType: DeathMessageType = .default
    ) -> Self {
        Self(
            id: id,
            exhaustion: exhaustion,
            damageEffect: damageEffect,
            deathMessageType: deathMessageType
        )
    }
}