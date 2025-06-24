
public protocol CommandSender {
    var name: String { get }
    
    func send(message: String) async
}
