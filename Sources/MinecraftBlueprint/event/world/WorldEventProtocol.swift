
public protocol WorldEventProtocol: EventProtocol, ~Copyable {
    var world: any WorldProtocol { get }
}