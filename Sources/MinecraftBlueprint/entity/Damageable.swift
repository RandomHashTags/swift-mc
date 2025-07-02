
public protocol Damageable: EntityProtocol, ~Copyable {
    var health: Double { get }
        
    mutating func tickDamageable(
        _ server: any ServerProtocol
    )
    
    mutating func damage<T: DamageCauseProtocol>(
        cause: T,
        amount: Double
    ) -> DamageResult
}