
public protocol CommandProtocol: MinecraftIdentifiable {
    associatedtype Permission: PermissionProtocol

    var label: String { get }
    var description: String { get }
    var usage: String { get }

    var aliases: Set<String> { get }
    var permission: Permission { get }
    
    /// - Returns: Whether or not the command was successfully executed by the sender.
    func execute<T: CommandSenderProtocol & ~Copyable>(
        sender: borrowing T,
        arguments: [String]
    ) -> Bool

    /// - Returns: A list of the available completions based on the sender's arguments.
    func tabComplete<T: CommandSenderProtocol & ~Copyable>(
        sender: borrowing T,
        arguments: [String]
    ) -> [String]
}