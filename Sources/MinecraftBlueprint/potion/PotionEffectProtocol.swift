
public protocol PotionEffectProtocol: MinecraftIdentifiable, Tickable {
    var type: any PotionEffectTypeProtocol { get }
    var hasIcon: Bool { get }
    var hasParticles: Bool { get }
    var isAmbient: Bool { get }
    var isInfinite: Bool { get }
    
    var amplifier: Int { get }

    /// Remaining duration, measured in ticks, for this potion effect.
    var duration: Int { get }
}