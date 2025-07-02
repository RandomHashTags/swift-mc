
public protocol CommandSender: Nameable, ~Copyable {
    func send(message: String) async
}