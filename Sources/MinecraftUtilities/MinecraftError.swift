
public struct MinecraftError: Error, CustomStringConvertible {
    public let sender:String, message:String

    public init(sender: String, message: String) {
        self.sender = sender
        self.message = message
    }
    
    public var description: String {
        return sender + ": " + message
    }
}
