
public protocol ChatManager: Actor {
    func send(sender: any CommandSender, receiver: String?, message: String) async
}
