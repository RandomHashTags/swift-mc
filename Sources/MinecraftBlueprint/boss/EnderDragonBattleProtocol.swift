
public protocol EnderDragonBattleProtocol: Sendable, ~Copyable {
    associatedtype BossBar: BossBarProtocol
    associatedtype EnderDragon: EnderDragonProtocol
    associatedtype BattleRespawnPhase: EnderDragonBattleRespawnPhaseProtocol

    var bossBar: BossBar { get }
    var enderDragon: EnderDragon { get }
    var endPortalLocation: (any LocationProtocol)? { get }
    var previouslySlain: Int { get }
    var respawnPhase: BattleRespawnPhase { get }

    func respawn()
    func tryRespawning<T: EnderCrystalProtocol>(
        with crystals: [T]
    ) -> Bool // TODO: make Set
}