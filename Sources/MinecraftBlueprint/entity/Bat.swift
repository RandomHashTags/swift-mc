
public protocol Bat: Ambient, Flyable, ~Copyable {
    var isAwake: Bool { get }
}