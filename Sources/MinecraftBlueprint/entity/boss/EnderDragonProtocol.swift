
public protocol EnderDragonProtocol: BossProtocol, Flying, HostileProtocol, LivingEntityPartableProtocol, MobProtocol, ~Copyable {
    /// Measured in ticks.
    var deathAnimationDuration: Int { get }
    var battle: (any EnderDragonBattleProtocol)? { get }
    var phase: any EnderDragonPhaseProtocol { get }
}