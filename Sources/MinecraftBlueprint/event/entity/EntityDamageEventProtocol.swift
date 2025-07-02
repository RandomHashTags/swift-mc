
public protocol EntityDamageEventProtocol: EntityEventCancellableProtocol, ~Copyable {
    var cause: any DamageCauseProtocol { get }
    var source: any DamageSourceProtocol { get }
    var damage: Double { get }
    var finalDamage: Double { get }
    
    init(entity: any EntityProtocol, cause: any DamageCauseProtocol, damage: Double)
}