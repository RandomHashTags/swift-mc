//
//  Server.swift
//  
//
//  Created by Evan Anderson on 4/23/23.
//

import Foundation

public protocol Server : NSObject, Tickable, Saveable {
    associatedtype TargetWorld : World
    
    var ticks_per_second : UInt8 { get set }
    var ticks_per_second_multiplier : Double { get set }
    var server_tick_interval_nano : UInt64 { get set }
    var server_is_awake : Bool { get set }
    var server_loop : Task<Void, Error>! { get set }
    var gravity : Double { get set }
    var gravity_per_tick : Double { get set }
    var void_damage_per_tick : Double { get set }
    
    var max_players : UInt64 { get set }
    var port : Int { get }
    var has_whitelist : Bool { get set }
    var whitelisted_players : Set<UUID> { get set }
    var banned_players : Set<BanEntry> { get set }
    var banned_ip_addresses : Set<BanEntry> { get set }
    
    var difficulties : [String:Difficulty] { get set }
    var worlds : [String:TargetWorld] { get set }
    
    var event_types : [String:EventType] { get set }
    
    var sound_categories : Set<SoundCategory> { get set }
    var sounds : Set<Sound> { get set }
    var materials : [String:Material] { get set }
    var biomes : Set<Biome> { get set }
    var enchantment_types : [String:EnchantmentType] { get set }
    var entity_types : [String:EntityType] { get set }
    var inventory_types : Set<InventoryType> { get set }
    var potion_effect_types : [String:PotionEffectType] { get set }
    var game_modes : [String:GameMode] { get set }
    var advancements : [String:Advancement] { get set }
    var art : Set<Art> { get set }
    var attributes : Set<Attribute> { get set }
    var instruments : Set<Instrument> { get set }
    var statistics : Set<Statistic> { get set }
    var commands : [String:Command] { get set }
    var permissions : [String:Permission] { get set }
    var recipes : [String:Recipe] { get set }
    
    var event_listeners : [String:[any EventListener]] { get set }
    
    func set_tick_rate(ticks_per_second: UInt8)
    
    func call_event(event: Event)
}


public extension Server {
    func wake_up() {
        guard !server_is_awake else { return }
        server_is_awake = true
        server_loop = Task {
            do {
                while server_is_awake {
                    tick(self)
                    
                    try await Task.sleep(nanoseconds: server_tick_interval_nano)
                }
            } catch {
                print("Server;encountered error during server loop: \(error)")
            }
        }
    }
    
    func call_event(event: Event) {
        guard let event_listeners:[any EventListener] = event_listeners[event.type.identifier] else { return }
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
        event_types[type.identifier] = type
    }
    
    func get_entity_type(identifier: String) -> EntityType? {
        return entity_types[identifier]
    }
    func get_world(name: String) -> TargetWorld? {
        return worlds[name]
    }
    
    
    func get_advancement(identifier: String) -> Advancement? {
        return advancements[identifier]
    }
    func get_command(identifier: String) -> Command? {
        return commands[identifier]
    }
    func get_enchantment_type(identifier: String) -> EnchantmentType? {
        return enchantment_types[identifier]
    }
    func get_game_mode(identifier: String) -> GameMode? {
        return game_modes[identifier]
    }
    func get_inventory_type(identifier: String) -> InventoryType? {
        return inventory_types.first(where: { $0.identifier.elementsEqual(identifier) })
    }
    
    func get_material(identifier: String) -> Material? {
        return materials[identifier]
    }
    func get_materials(identifiers: any Collection<String>) -> Set<Material>? {
        let map:[Material] = identifiers.compactMap({ materials[$0] })
        return map.isEmpty ? nil : Set<Material>(map)
    }
    
    func get_permission(identifier: String) -> Permission? {
        return permissions[identifier]
    }
    func get_potion_effect_type(identifier: String) -> PotionEffectType? {
        return potion_effect_types[identifier]
    }
    func get_statistic(identifier: String) -> Statistic? {
        return statistics.first(where: { $0.identifier.elementsEqual(identifier) })
    }
    
    func get_recipe(identifier: String) -> Recipe? {
        return recipes[identifier]
    }
    func get_recipes(identifiers: any Collection<String>) -> Set<Recipe>? {
        let map:[Recipe] = identifiers.compactMap({ recipes[$0] })
        return map.isEmpty ? nil : Set<Recipe>(map)
    }
}
public extension Server {
    func get_entity(uuid: UUID) -> (any Entity)? {
        for world in worlds {
            if let entity:any Entity = world.entities.first(where: { $0.uuid == uuid }) {
                return entity
            }
        }
        return nil
    }
}
