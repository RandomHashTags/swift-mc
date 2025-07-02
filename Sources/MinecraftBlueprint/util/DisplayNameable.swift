
public protocol DisplayNameable: Nameable, ~Copyable {
    var displayName: String? { get }
}