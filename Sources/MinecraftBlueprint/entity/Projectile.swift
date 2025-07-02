
public protocol Projectile: Entity, ~Copyable {
    var source: ProjectileSource? { get }
    mutating func tickProjectile(_ server: any Server)
}