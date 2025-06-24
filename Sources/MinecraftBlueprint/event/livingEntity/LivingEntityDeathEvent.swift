public protocol LivingEntityDeathEvent: LivingEntityEvent {
    var damageSource: any DamageSource { get }
    var droppedExp: Int { get }
    var drops: [any ItemStack] { get }
}
