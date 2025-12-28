
public struct DamageEffect: Sendable {
    public let id:String

    /// Sound played for this `DamageEffect`.
    public let sound:Sound
}

// MARK: Create
extension DamageEffect {
    public static func create(
        _ id: String,
        sound: Sound = Sound(id: "minecraft.unknown")
    ) -> Self {
        Self(
            id: id,
            sound: sound
        )
    }
}