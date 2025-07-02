
public protocol ChunkProtocol: Tickable, ~Copyable {
    associatedtype Block: BlockProtocol
    associatedtype LoadLevel: ChunkLoadLevelProtocol
    associatedtype World: WorldProtocol

    var world: World { get }
    var x: Int { get }
    var z: Int { get }

    var isEntitiesLoaded: Bool { get }
    var isForceLoaded: Bool { get }
    var isGenerated: Bool { get }
    var isLoaded: Bool { get }
    var isSlime: Bool { get }
    
    var blocks: [Block] { get } // TODO: make Set    
    var entities: [any EntityProtocol] { get } // TODO: make Set
    var structures: [any GeneratedStructureProtocol] { get } // TODO: make Set
    
    var loadLevel: LoadLevel { get }
    
    func load() async
    func unload() async
}

extension ChunkProtocol {
    @inlinable
    public var livingEntities: [any LivingEntityProtocol] {
        entities.compactMap({ $0 as? any LivingEntityProtocol })
    }
    @inlinable
    public var players: [any PlayerProtocol] {
        livingEntities.compactMap({ $0 as? any PlayerProtocol })
    }
}