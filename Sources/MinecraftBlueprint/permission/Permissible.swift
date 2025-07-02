
public protocol Permissible: Sendable, ~Copyable {
    var permissions: Set<String> { get }
}

extension Permissible {
    @inlinable
    public func hasPermission(_ permission: String) -> Bool {
        permissions.contains(permission)
    }
}
