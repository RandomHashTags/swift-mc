
public protocol LivingEntityBreedEventProtocol: LivingEntityEventCancellableProtocol, ~Copyable {
    var breeder: (any LivingEntityProtocol)? { get }
    var experience: Int { get }
    var father: any LivingEntityProtocol { get }
    var item: (any ItemStackProtocol)? { get }
    var mother: any LivingEntityProtocol { get }
}