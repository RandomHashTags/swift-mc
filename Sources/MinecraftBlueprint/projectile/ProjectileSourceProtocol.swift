
public protocol ProjectileSourceProtocol: Sendable, ~Copyable {
    var block: (any BlockProtocol)? { get }
    var entity: (any EntityProtocol)? { get }

    func launch(projectile: any ProjectileProtocol, velocity: Vector)
}
