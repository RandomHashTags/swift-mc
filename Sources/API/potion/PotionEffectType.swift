
/// A type of potion and its effect on an entity.
public struct PotionEffectType: Sendable {
    public let id:String

    /// If the effect of this type happens once, immediately.
    public let isInstant:Bool
}

// MARK: Create
extension PotionEffectType {
    public static func create(
        _ id: String,
        isInstant: Bool = false
    ) -> Self {
        Self(
            id: id,
            isInstant: isInstant
        )
    }
}