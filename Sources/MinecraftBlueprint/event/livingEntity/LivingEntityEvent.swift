
public protocol LivingEntityEvent: Event, ~Copyable {
    var entity: any LivingEntity { get }
}