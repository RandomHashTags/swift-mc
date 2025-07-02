
public protocol PotionEffectProtocol: MinecraftIdentifiable, Tickable {
    associatedtype PotionEffectType: PotionEffectTypeProtocol

    var type: PotionEffectType { get }
    var hasIcon: Bool { get }
    var hasParticles: Bool { get }
    var isAmbient: Bool { get }
    var isInfinite: Bool { get }
    
    var amplifier: Int { get }

    /// Remaining duration, measured in ticks, for this potion effect.
    var duration: Int { get }
}