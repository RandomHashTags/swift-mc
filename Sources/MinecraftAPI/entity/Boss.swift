public protocol Boss: Entity {
    var bossBar: (any BossBar)? { get }
}