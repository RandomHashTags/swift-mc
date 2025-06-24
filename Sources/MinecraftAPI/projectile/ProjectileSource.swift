public protocol ProjectileSource {
    var block: (any Block)? { get }
    var entity: (any Entity)? { get }

    func launch(projectile: any Projectile, velocity: Vector)
}
