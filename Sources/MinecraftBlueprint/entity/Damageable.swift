
public protocol Damageable: EntityProtocol, ~Copyable {
    var health: Double { get }
        
    mutating func tickDamageable(_ server: any ServerProtocol)
    
    mutating func damage(cause: any DamageCauseProtocol, amount: Double) -> DamageResult
}