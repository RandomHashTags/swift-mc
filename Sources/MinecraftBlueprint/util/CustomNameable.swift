
public protocol CustomNameable: Nameable, ~Copyable {
    var customName: String? { get }
}