
public protocol LivingEntityBreedEvent: LivingEntityEventCancellable, ~Copyable {
    var breeder: (any LivingEntity)? { get }
    var experience: Int { get }
    var father: any LivingEntity { get }
    var item: (any ItemStack)? { get }
    var mother: any LivingEntity { get }
}