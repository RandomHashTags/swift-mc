
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol WorldProtocol: Tickable, ~Copyable {
    var uuid: UUID { get }
    var seed: Int64 { get }
    var name: String { get }
    
    var spawnLocation: Vector { get }
    var difficulty: any DifficultyProtocol { get }
    var time: UInt64 { get }
    var border: (any WorldBorderProtocol)? { get }
    
    var yMin: Int { get }
    var yMax: Int { get }
    var ySeaLevel: Int { get }
    
    var allowsAnimals: Bool { get }
    var allowsMonsters: Bool { get }
    var allowsPVP: Bool { get }
    
    var autosaves: Bool { get }
    var bedsWork: Bool { get }

    var variant: any WorldVariantProtocol { get }

    /// - Returns: The chunk that is loaded at the given coordinates. Returns `nil` if the chunk is not loaded.
    func getChunk(
        x: Int,
        z: Int
    ) -> (any ChunkProtocol)?

    mutating func getOrLoadChunk(
        x: Int,
        z: Int
    ) async -> any ChunkProtocol

    mutating func loadChunk(
        x: Int,
        z: Int
    ) async

    mutating func unloadChunk(
        x: Int,
        z: Int
    ) async


    func save() async
    
    mutating func spawn(_ entity: any EntityProtocol)
    mutating func remove(_ entity: any EntityProtocol)
    
    func getNearbyEntities(center: any LocationProtocol, x: Double, y: Double, z: Double) -> [any EntityProtocol]
    func getNearbyEntities(center: any LocationProtocol, xRadius: Double, yRadius: Double, zRadius: Double) -> [any EntityProtocol]
    
    func getEntity(uuid: UUID) -> (any EntityProtocol)?
    func getEntities(uuids: Set<UUID>) -> [any EntityProtocol] // TODO: make Set

    func getGameRule(id: MinecraftIdentifiableID) -> (any GameRuleProtocol)?

    func getSpawnLimit(category: any SpawnCategoryProtocol) -> Int

    func getWeather() -> any WeatherProtocol
    mutating func setWeather(_ weather: any WeatherProtocol)
}