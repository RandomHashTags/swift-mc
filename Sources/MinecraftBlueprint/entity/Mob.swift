
public protocol Mob: LivingEntity, Lootable, ~Copyable {
    var isAware: Bool { get }
    var soundAmbient: (any Sound)? { get }
    var target: (any LivingEntity)? { get }
}