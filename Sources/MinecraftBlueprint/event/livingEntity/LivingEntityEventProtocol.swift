
public protocol LivingEntityEventProtocol: EventProtocol, ~Copyable {
    var entity: any LivingEntityProtocol { get }
}