
public protocol Tickable: ServerTickChangeListener, ~Copyable {
    /// Logic executed every server tick.
    mutating func tick(_ server: any Server)
}
