
public protocol EnderDragonBattleProtocol: Sendable, ~Copyable {
    var bossBar: any BossBarProtocol { get }
    var enderDragon: any EnderDragonProtocol { get }
    var endPortalLocation: (any LocationProtocol)? { get }
    var previouslySlain: Int { get }
    var respawnPhase: any EnderDragonBattleRespawnPhaseProtocol { get }

    func respawn()
    func tryRespawning(with crystals: [any EnderCrystalProtocol]) -> Bool // TODO: make Set
}