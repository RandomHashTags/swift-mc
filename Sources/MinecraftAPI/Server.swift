//
//  Server.swift
//  
//
//  Created by Evan Anderson on 4/23/23.
//

import Foundation
import MinecraftPackets

public protocol Server : Tickable {
    
    var chatManager : ChatManager { get }
    var version : SemanticVersion { get }
    
    var ticksPerSecond : UInt8 { get }
    var ticksPerSecondMultiplier : Double { get }
    var serverTickIntervalNano : UInt64 { get }
    var serverIsAwake : Bool { get }
    var server_loop : Task<Void, Error>! { get }
    var gravity : Double { get }
    var gravityPerTick : Double { get }
    var voidDamagePerTick : Double { get }
    var fireDamagePerSecond : Double { get }
    
    var maxPlayers : UInt64 { get }
    var port : Int { get }
    var isWhitelisted : Bool { get }
    var whitelistedPlayers : Set<UUID> { get }
    //var bannedPlayers : Set<BanEntry> { get }
    //var bannedIPAddresses : Set<BanEntry> { get }
    
    var difficulties : [String : any Difficulty] { get }
    var worlds : [String : any World] { get }
    
    var event_types : [String : any EventType] { get }
    
    var sound_categories : [String : any SoundCategory] { get }
    var sounds : [String : any Sound] { get }
    var materials : [String : any Material] { get }
    var biomes : [String : any Biome] { get }
    var enchantment_types : [String : any EnchantmentType] { get }
    var entity_types : [String : any EntityType] { get }
    var inventory_types : [String : any InventoryType] { get }
    var potion_effect_types : [String : any PotionEffectType] { get }
    var game_modes : [String : any GameMode] { get }
    var advancements : [String : any Advancement] { get }
    var art : [String : any Art] { get }
    var attributes : [String : any Attribute] { get }
    var instruments : [String : any Instrument] { get }
    var statistics : [String : any Statistic] { get }
    var commands : [String : any Command] { get }
    var permissions : [String : any Permission] { get }
    var recipes : [String : any Recipe] { get }
    
    var event_listeners : [String : [any EventListener]] { get }
    
    func setTickRate(ticksPerSecond: UInt8)
    func wakeUp()
    
    func callEvent(event: some Event)
    
    func getNearbyEntities(center: any Location, xRadius: Double, yRadius: Double, zRadius: Double) -> [any Entity]
    
    func getEntity(uuid: UUID) -> (any Entity)?
    func getEntities(uuids: Set<UUID>) -> [any Entity]
    
    func getLivingEntity(uuid: UUID) -> (any LivingEntity)?
    func getLivingEntities(uuids: Set<UUID>) -> [any LivingEntity]
    
    func getPlayer(uuid: UUID) -> (any Player)?
    func getPlayers(uuids: Set<UUID>) -> [any Player]
}


/*
public extension Server {
    var players : [any Player] {
        return []//ServerMojang.instance.player_connections.values.compactMap({ $0.player })
    }
    
    func tick(_ server: any Server) {
        for world in worlds.values {
            world.tick(server)
        }
    }
    
    func serverTPSSlowed(to tps: Int, divisor: Int) {
        gravityPerTick *= Double(divisor)
        voidDamagePerTick *= Double(divisor)
        
        for i in entity_types.indices {
            entity_types[i].value.serverTPSSlowed(to: tps, divisor: divisor)
        }
        for entity_type in entity_types.values {
            entity_type.serverTPSSlowed(to: tps, divisor: divisor)
        }
        
        for material in materials.values {
            let configuration:any MaterialConfiguration = material.configuration
            if let test:any MaterialItemConsumableConfiguration = configuration.item?.consumable {
                test.serverTPSSlowed(to: tps, divisor: divisor)
            }
            if let test:any MaterialBlockLiquidConfiguration = configuration.block?.liquid {
                test.serverTPSSlowed(to: tps, divisor: divisor)
            }
        }
        
        for world in worlds.values {
            world.serverTPSSlowed(to: tps, divisor: divisor)
        }
    }
    func serverTPSIncreased(to tps: Int, multiplier: Int) {
        gravityPerTick /= Double(multiplier)
        voidDamagePerTick /= Double(multiplier)
        
        for entity_type in entity_types.values {
            entity_type.serverTPSIncreased(to: tps, multiplier: multiplier)
        }
        
        for material in materials.values {
            let configuration:any MaterialConfiguration = material.configuration
            if let test:any MaterialItemConsumableConfiguration = configuration.item?.consumable {
                test.serverTPSIncreased(to: tps, multiplier: multiplier)
            }
            if let test:any MaterialBlockLiquidConfiguration = configuration.block?.liquid {
                test.serverTPSIncreased(to: tps, multiplier: multiplier)
            }
        }
        
        for world in worlds.values {
            world.serverTPSIncreased(to: tps, multiplier: multiplier)
        }
    }
    
    func callEvent(event: some Event) {
        guard let event_listeners:[any EventListener] = event_listeners[event.type.id] else { return }
        for listener in event_listeners {
            listener.handle(event: event)
        }
    }
}

public extension Server {
    func get_event_type(identifier: String) -> EventType? {
        return event_types[identifier]
    }
    func register_event_type(type: EventType) throws {
        event_types[type.id] = type
    }
    
    func get_entity_type(identifier: String) -> (any EntityType)? {
        return entity_types[identifier]
    }
    func get_world(name: String) -> (any World)? {
        return worlds[name]
    }
    
    
    func get_advancement(id: String) -> (any Advancement)? {
        return advancements[id]
    }
    func get_command(identifier: String) -> (any Command)? {
        return commands[identifier]
    }
    func get_enchantment_type(identifier: String) -> (any EnchantmentType)? {
        return enchantment_types[identifier]
    }
    func get_game_mode(identifier: String) -> (any GameMode)? {
        return game_modes[identifier]
    }
    func get_inventory_type(identifier: String) -> (any InventoryType)? {
        return inventory_types[identifier]
    }
    
    func get_material(identifier: String) -> (any Material)? {
        return materials[identifier]
    }
    func get_materials(identifiers: any Collection<String>) -> [any Material] {
        return identifiers.compactMap({ materials[$0] })
    }
    
    func get_permission(identifier: String) -> (any Permission)? {
        return permissions[identifier]
    }
    func get_potion_effect_type(identifier: String) -> (any PotionEffectType)? {
        return potion_effect_types[identifier]
    }
    func get_statistic(identifier: String) -> (any Statistic)? {
        return statistics[identifier]
    }
    
    func get_recipe(identifier: String) -> (any Recipe)? {
        return recipes[identifier]
    }
    func get_recipes(identifiers: any Collection<String>) -> [any Recipe] {
        return identifiers.compactMap({ recipes[$0] })
    }
    
    func get_instrument(identifier: String) -> (any Instrument)? {
        return instruments[identifier]
    }
}

public extension Server {
    func getNearbyEntities(center: any Location, xRadius: Double, yRadius: Double, zRadius: Double) -> [any Entity] {
        return center.world.entities.filter({ $0.location.isNearby(center: center, xRadius: xRadius, yRadius: yRadius, zRadius: zRadius) })
    }
    
    func getEntity(uuid: UUID) -> (any Entity)? {
        for world in worlds.values {
            if let entity:any Entity = world.entities.first(where: { $0.uuid == uuid }) {
                return entity
            }
        }
        return nil
    }
    func getEntities(uuids: Set<UUID>) -> [any Entity] {
        return worlds.values.flatMap({ $0.entities.filter({ uuids.contains($0.uuid) }) })
    }
    
    func getLivingEntity(uuid: UUID) -> (any LivingEntity)? {
        for world in worlds.values {
            if let entity:any LivingEntity = world.livingEntities.first(where: { $0.uuid == uuid }) {
                return entity
            }
        }
        return nil
    }
    func getLivingEntities(uuids: Set<UUID>) -> [any LivingEntity] {
        return worlds.values.flatMap({ $0.livingEntities.filter({ uuids.contains($0.uuid) }) })
    }
    
    func getPlayer(uuid: UUID) -> (any Player)? {
        return nil//ServerMojang.instance.player_connections[uuid]?.player
    }
    func getPlayers(uuids: Set<UUID>) -> [any Player] {
        return worlds.values.flatMap({ $0.players.filter({ uuids.contains($0.uuid) }) })
    }
}
*/