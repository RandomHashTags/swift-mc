
public protocol PermissionProtocol: MinecraftIdentifiable {
    /// The child permissions granted when they have this permission.
    var children: Set<String> { get }
    var defaultValue: any PermissionDefaultValueProtocol { get }
}