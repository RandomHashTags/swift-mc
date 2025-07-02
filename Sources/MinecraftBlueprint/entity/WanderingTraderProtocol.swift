
public protocol WanderingTraderProtocol: Merchantable, ~Copyable {
    /// Measured in ticks.
    var despawnDelay: Int { get }
}