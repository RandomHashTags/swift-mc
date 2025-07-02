
public protocol BossProtocol: EntityProtocol, ~Copyable {
    var bossBar: (any BossBarProtocol)? { get }
}