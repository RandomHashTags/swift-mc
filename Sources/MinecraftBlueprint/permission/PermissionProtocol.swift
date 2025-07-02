
public protocol PermissionProtocol: MinecraftIdentifiable {
    associatedtype DefaultValue: PermissionDefaultValueProtocol

    /// The child permissions granted when they have this permission.
    var children: Set<String> { get }
    var defaultValue: DefaultValue { get }
}