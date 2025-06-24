
public protocol Permissible {
    var permissions: Set<String> { get }
}

public extension Permissible {
    func hasPermission(_ permission: String) -> Bool { permissions.contains(permission) }
}
