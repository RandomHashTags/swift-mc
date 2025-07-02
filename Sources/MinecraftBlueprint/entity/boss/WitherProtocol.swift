
public protocol WitherProtocol: BossProtocol, MonsterProtocol, ~Copyable {
    /// Measured in ticks.
    var remainingInvulnerabilityDuration: Int { get }
    
    func target(
        for head: any WitherHeadProtocol
    ) -> (any LivingEntityProtocol)?
}