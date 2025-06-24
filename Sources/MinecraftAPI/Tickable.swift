public protocol Tickable: ServerTickChangeListener {
    /// Logic executed every server tick.
    mutating func tick(_ server: any Server)
}
