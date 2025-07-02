
public protocol EnderDragonProtocol: BossProtocol, Flying, HostileProtocol, LivingEntityPartableProtocol, MobProtocol, ~Copyable {
    associatedtype Battle: EnderDragonBattleProtocol
    associatedtype Phase: EnderDragonPhaseProtocol

    /// Measured in ticks.
    var deathAnimationDuration: Int { get }
    var battle: Battle? { get }
    var phase: Phase { get }
}