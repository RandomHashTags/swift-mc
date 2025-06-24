public protocol EnderDragon: Boss, Flying, Hostile, LivingEntityPartable, Mob {
    /// Measured in ticks.
    var deathAnimationDuration: Int { get }
    var battle: (any EnderDragonBattle)? { get }
    var phase: any EnderDragonPhase { get }
}