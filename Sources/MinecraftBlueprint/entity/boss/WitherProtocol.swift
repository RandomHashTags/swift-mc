
public protocol WitherProtocol: BossProtocol, MonsterProtocol, ~Copyable {
    associatedtype Head: WitherHeadProtocol

    /// Measured in ticks.
    var remainingInvulnerabilityDuration: Int { get }
    
    func target(
        for head: Head
    ) -> (any LivingEntityProtocol)?
}