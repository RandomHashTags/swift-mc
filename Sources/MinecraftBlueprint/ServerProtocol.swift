
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

import MinecraftPackets

public protocol ServerProtocol: Tickable, ~Copyable {
    associatedtype ChatManager: ChatManagerProtocol
    
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
    
    func callEvent(event: some EventProtocol)
    
    func getNearbyEntities<T: LocationProtocol>(
        center: T,
        xRadius: Double,
        yRadius: Double,
        zRadius: Double
    ) -> [any EntityProtocol]
    
    func getEntity(uuid: UUID) -> (any EntityProtocol)?
    func getEntities(uuids: Set<UUID>) -> [any EntityProtocol]
    
    func getLivingEntity(uuid: UUID) -> (any LivingEntityProtocol)?
    func getLivingEntities(uuids: Set<UUID>) -> [any LivingEntityProtocol]
    
    func getPlayer(uuid: UUID) -> (any PlayerProtocol)?
    func getPlayers(uuids: Set<UUID>) -> [any PlayerProtocol]

    func getFeature<T: MinecraftIdentifiable>(category: any FeatureCategoryProtocol, id: T.ID) -> T?
    /// - Returns: Whether or not registering the feature suceeded.
    mutating func registerFeature(category: any FeatureCategoryProtocol, _ feature: any MinecraftIdentifiable) -> Bool
}