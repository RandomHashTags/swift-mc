#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif
import MinecraftPackets

public protocol Server: Tickable {
    
    var chatManager: ChatManager { get }
    var version: SemanticVersion { get }
    
    var ticksPerSecond: UInt8 { get }
    var ticksPerSecondMultiplier: Double { get }
    var serverTickIntervalNano: UInt64 { get }
    var serverIsAwake: Bool { get }
    var serverLoop: Task<Void, Error> { get }

    var gravity: Double { get }
    var gravityPerTick: Double { get }

    var voidDamagePerTick: Double { get }
    var fireDamagePerSecond: Double { get }
    
    var maxPlayers: Int { get }
    var port: Int { get }
    var isWhitelisted: Bool { get }
    var whitelistedPlayers: Set<UUID> { get }
    //var bannedPlayers: Set<BanEntry> { get }
    //var bannedIPAddresses: Set<BanEntry> { get }
    
    mutating func setTickRate(ticksPerSecond: UInt8)
    mutating func wakeUp()
    
    func callEvent(event: some Event)
    
    func getNearbyEntities(center: any Location, xRadius: Double, yRadius: Double, zRadius: Double) -> [any Entity]
    
    func getEntity(uuid: UUID) -> (any Entity)?
    func getEntities(uuids: Set<UUID>) -> [any Entity]
    
    func getLivingEntity(uuid: UUID) -> (any LivingEntity)?
    func getLivingEntities(uuids: Set<UUID>) -> [any LivingEntity]
    
    func getPlayer(uuid: UUID) -> (any Player)?
    func getPlayers(uuids: Set<UUID>) -> [any Player]

    func getFeature<T: MinecraftIdentifiable>(category: any FeatureCategory, id: T.ID) -> T?
    /// - Returns: Whether or not registering the feature suceeded.
    mutating func registerFeature(category: any FeatureCategory, _ feature: any MinecraftIdentifiable) -> Bool
}