
public protocol WanderingTrader: Merchantable, ~Copyable {
    /// Measured in ticks.
    var despawnDelay: Int { get }
}