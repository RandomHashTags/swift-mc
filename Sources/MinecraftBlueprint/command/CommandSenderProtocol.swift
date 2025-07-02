
public protocol CommandSenderProtocol: Nameable, ~Copyable {
    func send(message: String) async
}