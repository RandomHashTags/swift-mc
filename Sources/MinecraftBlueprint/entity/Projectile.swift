public protocol Projectile: Entity {
    var source: ProjectileSource? { get }
    mutating func tickProjectile(_ server: any Server)
}