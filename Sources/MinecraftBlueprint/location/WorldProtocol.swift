
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol WorldProtocol: Tickable, ~Copyable {
    associatedtype Border: WorldBorderProtocol
    associatedtype Chunk: ChunkProtocol
    associatedtype Difficulty: DifficultyProtocol
    associatedtype Variant: WorldVariantProtocol
    associatedtype Weather: WeatherProtocol

    var uuid: UUID { get }
    var seed: Int64 { get }
    var name: String { get }
    
    var spawnLocation: Vector { get }
    var difficulty: Difficulty { get }
    var time: UInt64 { get }
    var border: Border? { get }
    
    var yMin: Int { get }
    var yMax: Int { get }
    var ySeaLevel: Int { get }
    
    var allowsAnimals: Bool { get }
    var allowsMonsters: Bool { get }
    var allowsPVP: Bool { get }
    
    var autosaves: Bool { get }
    var bedsWork: Bool { get }

    var variant: Variant { get }

    /// - Returns: The chunk that is loaded at the given coordinates, otherwise `nil`.
    func getChunk(
        x: Int,
        z: Int
    ) -> Chunk?

    mutating func getOrLoadChunk(
        x: Int,
        z: Int
    ) async -> Chunk

    mutating func loadChunk(
        x: Int,
        z: Int
    ) async

    mutating func unloadChunk(
        x: Int,
        z: Int
    ) async


    func save() async
    
    mutating func spawn<T: EntityProtocol>(_ entity: T)
    mutating func remove<T: EntityProtocol>(_ entity: T)
    
    func getNearbyEntities<T: LocationProtocol>(
        center: T,
        x: Double,
        y: Double,
        z: Double
    ) -> [any EntityProtocol]

    func getNearbyEntities<T: LocationProtocol>(
        center: T,
        xRadius: Double,
        yRadius: Double,
        zRadius: Double
    ) -> [any EntityProtocol]
    
    func getEntity(uuid: UUID) -> (any EntityProtocol)?
    func getEntities(uuids: Set<UUID>) -> [any EntityProtocol] // TODO: make Set

    func getGameRule(id: MinecraftIdentifiableID) -> (any GameRuleProtocol)?

    func getSpawnLimit<T: SpawnCategoryProtocol>(category: T) -> Int

    func getWeather() -> Weather
    mutating func setWeather(_ weather: Weather)
}