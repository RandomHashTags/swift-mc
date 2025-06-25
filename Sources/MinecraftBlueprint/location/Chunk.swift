public protocol Chunk: Tickable {
    var world: any World { get }
    var x: Int { get }
    var z: Int { get }

    var isEntitiesLoaded: Bool { get }
    var isForceLoaded: Bool { get }
    var isGenerated: Bool { get }
    var isLoaded: Bool { get }
    var isSlime: Bool { get }
    
    var blocks: [any Block] { get } // TODO: make Set    
    var entities: [any Entity] { get } // TODO: make Set
    var structures: [any GeneratedStructure] { get } // TODO: make Set
    
    var loadLevel: any ChunkLoadLevel { get }
    
    func load() async
    func unload() async
}

extension Chunk {
    @inlinable
    public var livingEntities: [any LivingEntity] {
        entities.compactMap({ $0 as? any LivingEntity })
    }
    @inlinable
    public var players: [any Player] {
        livingEntities.compactMap({ $0 as? any Player })
    }
}