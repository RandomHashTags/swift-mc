public protocol Block: Tickable {
    var instrument: (any Instrument)? { get }
    
    var stepSound: (any Sound)? { get }
    
    var data: any BlockData { get }
    var location: any Location { get }
    var boundary: any Boundary { get }
    
    var growableAge: Int? { get }

    var isPowered: Bool { get }
    var isPassable: Bool { get }

    var temperature: Double { get }
    var humidity: Double { get }
    
    var lootTable: LootTable? { get }

    // MARK: logic
    func breakNaturally() -> Bool
    func breakNaturally(item: (any ItemStack)?) -> Bool
    
    func isPreferredTool(_ material: any Material) -> Bool
    /// Measured in ticks.
    
    func getBreakingSpeed(_ itemStack: any ItemStack) -> Float
    /// Measured in ticks.
    func getBreakingSpeed(_ player: any Player) -> Float
}

extension Block {
    public var world: any World {
        location.world
    }

    public var isLiquid: Bool {
        data.material.configuration.block?.liquid != nil
    }
}