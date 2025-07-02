
public protocol ProjectileSourceProtocol: Sendable, ~Copyable {
    associatedtype Block: BlockProtocol
    associatedtype Entity: EntityProtocol

    var block: Block? { get }
    var entity: EntityProtocol? { get }

    func launch(
        projectile: any ProjectileProtocol,
        velocity: Vector
    )
}
