
public protocol ChatManagerProtocol: Sendable, ~Copyable {
    func send(
        sender: any CommandSenderProtocol,
        receiver: String?,
        message: String
    ) async
}