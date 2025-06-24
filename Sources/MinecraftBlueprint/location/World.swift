import Foundation

public protocol World: Tickable {
    var uuid: UUID { get }
    var seed: Int64 { get }
    var name: String { get }
    
    var spawnLocation: Vector { get }
    var difficulty: any Difficulty { get }
    var time: UInt64 { get }
    var border: (any WorldBorder)? { get }
    
    var yMin: Int { get }
    var yMax: Int { get }
    var ySeaLevel: Int { get }
    
    var allowsAnimals: Bool { get }
    var allowsMonsters: Bool { get }
    var allowsPVP: Bool { get }
    
    var autosaves: Bool { get }
    var bedsWork: Bool { get }

    var variant: any WorldVariant { get }

    /// - Returns: The chunk that is loaded at the given coordinates. Returns `nil` if the chunk is not loaded.
    func getChunk(x: Int, z: Int) -> (any Chunk)?
    mutating func getOrLoadChunk(x: Int, z: Int) async -> any Chunk
    mutating func loadChunk(x: Int, z: Int) async
    mutating func unloadChunk(x: Int, z: Int) async

    func save() async
    
    mutating func spawn(_ entity: any Entity)
    mutating func remove(_ entity: any Entity)
    
    func getNearbyEntities(center: any Location, x: Double, y: Double, z: Double) -> [any Entity]
    func getNearbyEntities(center: any Location, xRadius: Double, yRadius: Double, zRadius: Double) -> [any Entity]
    
    func getEntity(uuid: UUID) -> (any Entity)?
    func getEntities(uuids: Set<UUID>) -> [any Entity] // TODO: make Set

    func getGameRule(id: MinecraftIdentifiableID) -> (any GameRule)?

    func getSpawnLimit(category: any SpawnCategory) -> Int

    func getWeather() -> any Weather
    mutating func setWeather(_ weather: any Weather)
}