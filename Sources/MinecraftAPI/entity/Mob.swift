public protocol Mob: LivingEntity, Lootable {
    var isAware: Bool { get }
    var soundAmbient: (any Sound)? { get }
    var target: (any LivingEntity)? { get }
}