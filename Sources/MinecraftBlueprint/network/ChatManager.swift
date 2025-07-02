
public protocol ChatManager: Sendable, ~Copyable {
    func send(
        sender: any CommandSender,
        receiver: String?,
        message: String
    ) async
}