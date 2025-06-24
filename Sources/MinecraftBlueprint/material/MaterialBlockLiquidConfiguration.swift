public protocol MaterialBlockLiquidConfiguration: ServerTickChangeListener {
    /// [`World` name: distance per tick]
    var distancesPerTick: [String: Double] { get }
}