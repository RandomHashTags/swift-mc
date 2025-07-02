
public protocol TurtleProtocol: AnimalProtocol, ~Copyable {
    var hasEgg: Bool { get }
    var isLayingEgg: Bool { get }
}