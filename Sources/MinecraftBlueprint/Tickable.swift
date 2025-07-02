
public protocol Tickable: ServerTickChangeListenerProtocol, ~Copyable {
    /// Logic executed every server tick.
    mutating func tick(_ server: any ServerProtocol)
}
