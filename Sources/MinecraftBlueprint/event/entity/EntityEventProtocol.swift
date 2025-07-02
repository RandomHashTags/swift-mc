
public protocol EntityEventProtocol: EventProtocol, ~Copyable {
    var entity: any EntityProtocol { get }
}