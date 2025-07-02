
public protocol Explosion: MinecraftIdentifiable {
    associatedtype Effect: ExplosionEffectProtocol

    var location: any LocationProtocol { get }
    var effect: Effect { get }
    
    var radius: Float { get }
}