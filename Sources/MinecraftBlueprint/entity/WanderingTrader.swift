public protocol WanderingTrader: Merchantable {
    /// Measured in ticks.
    var despawnDelay: Int { get }
}