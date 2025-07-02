
public protocol LivingEntityDeathEventProtocol: LivingEntityEventProtocol, ~Copyable {
    var damageSource: any DamageSourceProtocol { get }
    var droppedExp: Int { get }
    var drops: [any ItemStackProtocol] { get }
}