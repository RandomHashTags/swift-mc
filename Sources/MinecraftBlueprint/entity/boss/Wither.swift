public protocol Wither: Boss, Monster {
    /// Measured in ticks.
    var remainingInvulnerabilityDuration: Int { get }
    
    func target(for head: any WitherHead) -> (any LivingEntity)?
}