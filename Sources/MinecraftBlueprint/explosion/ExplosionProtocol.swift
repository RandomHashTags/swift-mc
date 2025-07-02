
public protocol Explosion: MinecraftIdentifiable {
    var location: any LocationProtocol { get }
    var effect: any ExplosionEffectProtocol { get }
    
    var radius: Float { get }
}