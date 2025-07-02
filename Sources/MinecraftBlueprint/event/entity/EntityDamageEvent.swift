public protocol EntityDamageEvent: EntityEventCancellable, ~Copyable {
    var cause: any DamageCause { get }
    var source: any DamageSource { get }
    var damage: Double { get }
    var finalDamage: Double { get }
    
    init(entity: any Entity, cause: any DamageCause, damage: Double)
}