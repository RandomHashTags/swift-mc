
public protocol Boss: Entity, ~Copyable {
    var bossBar: (any BossBar)? { get }
}