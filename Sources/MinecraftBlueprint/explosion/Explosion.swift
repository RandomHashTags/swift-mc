
public protocol Explosion: MinecraftIdentifiable {
    var location: any Location { get }
    var effect: any ExplosionEffect { get }
    
    var radius: Float { get }
}