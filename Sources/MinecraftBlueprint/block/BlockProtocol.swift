
public protocol BlockProtocol: Tickable, ~Copyable {
    associatedtype BlockData: BlockDataProtocol
    associatedtype Instrument: InstrumentProtocol
    associatedtype Location: LocationProtocol

    var instrument: Instrument? { get }
    
    var stepSound: (any SoundProtocol)? { get }
    
    var data: BlockData { get }
    var location: Location { get }
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

    func isPreferredTool<T: MaterialProtocol>(
        _ material: T
    ) -> Bool

    /// Measured in ticks.
    func getBreakingSpeed<T: ItemStackProtocol>(
        _ itemStack: T)
     -> Float

    /// Measured in ticks.
    func getBreakingSpeed<T: PlayerProtocol>(
        _ player: T
    ) -> Float
}

extension BlockProtocol {
    @inlinable
    public var world: Location.World {
        location.world
    }

    @inlinable
    public var isLiquid: Bool {
        data.material.configuration.block?.liquid != nil
    }
}