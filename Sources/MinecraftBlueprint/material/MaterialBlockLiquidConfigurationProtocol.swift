
public protocol MaterialBlockLiquidConfigurationProtocol: ServerTickChangeListenerProtocol {
    /// [`World` name: distance per tick]
    var distancesPerTick: [String: Double] { get }
}