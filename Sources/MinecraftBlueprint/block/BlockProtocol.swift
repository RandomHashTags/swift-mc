
public protocol BlockProtocol: Tickable, ~Copyable {
    var instrument: (any InstrumentProtocol)? { get }
    
    var stepSound: (any SoundProtocol)? { get }
    
    var data: any BlockDataProtocol { get }
    var location: any LocationProtocol { get }
    var boundary: any BoundaryProtocol { get }
    
    var growableAge: Int? { get }

    var isPowered: Bool { get }
    var isPassable: Bool { get }

    var temperature: Double { get }
    var humidity: Double { get }
    
    var lootTable: (any LootTableProtocol)? { get }

    // MARK: logic
    func breakNaturally() -> Bool
    func breakNaturally(item: (any ItemStackProtocol)?) -> Bool
    
    func isPreferredTool(_ material: any MaterialProtocol) -> Bool
    /// Measured in ticks.
    
    func getBreakingSpeed(_ itemStack: any ItemStackProtocol) -> Float
    /// Measured in ticks.
    func getBreakingSpeed(_ player: any PlayerProtocol) -> Float
}

extension BlockProtocol {
    @inlinable
    public var world: any WorldProtocol {
        location.world
    }

    @inlinable
    public var isLiquid: Bool {
        data.material.configuration.block?.liquid != nil
    }
}