
public protocol ChunkProtocol: Tickable, ~Copyable {
    var world: any WorldProtocol { get }
    var x: Int { get }
    var z: Int { get }

    var isEntitiesLoaded: Bool { get }
    var isForceLoaded: Bool { get }
    var isGenerated: Bool { get }
    var isLoaded: Bool { get }
    var isSlime: Bool { get }
    
    var blocks: [any BlockProtocol] { get } // TODO: make Set    
    var entities: [any EntityProtocol] { get } // TODO: make Set
    var structures: [any GeneratedStructureProtocol] { get } // TODO: make Set
    
    var loadLevel: any ChunkLoadLevelProtocol { get }
    
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