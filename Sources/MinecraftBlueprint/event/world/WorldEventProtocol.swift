
public protocol WorldEventProtocol: EventProtocol, ~Copyable {
    associatedtype World: WorldProtocol

    var world: World { get }
}