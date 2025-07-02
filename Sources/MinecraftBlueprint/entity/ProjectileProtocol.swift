
public protocol ProjectileProtocol: EntityProtocol, ~Copyable {
    var source: (any ProjectileSourceProtocol)? { get }
    mutating func tickProjectile(_ server: any ServerProtocol)
}