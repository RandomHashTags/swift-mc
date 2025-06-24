public protocol LivingEntityEvent: Event {
    var entity: any LivingEntity { get }
}