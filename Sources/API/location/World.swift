//
//  World.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

import Foundation

public protocol World : AnyObject, Hashable, Tickable {
    var uuid : UUID { get }
    var seed : Int64 { get }
    var name : String { get }
    
    var spawn_location : Vector { get set }
    var difficulty : Difficulty { get set }
    var game_rules : [GameRule] { get set }
    var time : UInt64 { get set }
    var border : WorldBorder? { get set }
    
    var y_min : Int { get set }
    var y_max : Int { get set }
    var y_sea_level : Int { get set }
    
    var chunks_loaded : [any Chunk] { get set }
    
    var allows_animals : Bool { get set }
    var allows_monsters : Bool { get set }
    var allows_pvp : Bool { get set }
    
    var beds_work : Bool { get set}
    
    var entities : [any Entity] { get set }
    var living_entities : [any LivingEntity] { get set }
    var players : [any Player] { get }
    
    func equals(_ world: any World) -> Bool
    func load_chunk(x: Int, z: Int) async
    func unload_chunk(x: Int, z: Int) async
    
    func spawn_entity(_ entity: any Entity)
    func remove_entity(_ entity: any Entity)
    
    func spawn_living_entity(_ entity: any LivingEntity)
    func remove_living_entity(_ entity: any LivingEntity)
    
    func getNearbyEntities(center: any Location, x: Double, y: Double, z: Double) -> [any Entity]
    func getNearbyEntities(center: any Location, x_radius: Double, y_radius: Double, z_radius: Double) -> [any Entity]
    
    func getEntity(uuid: UUID) -> (any Entity)?
    func getEntities(uuids: Set<UUID>) -> [any Entity]
    
    func getLivingEntity(uuid: UUID) -> (any LivingEntity)?
    func getLivingEntities(uuids: Set<UUID>) -> [any LivingEntity]
    
    func getPlayer(uuid: UUID) -> (any Player)?
    func getPlayers(uuids: Set<UUID>) -> [any Player]
}

public extension World {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.uuid == rhs.uuid && lhs.seed == rhs.seed && lhs.name.elementsEqual(rhs.name)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
        hasher.combine(seed)
        hasher.combine(name)
    }
    
    func equals(_ world: any World) -> Bool {
        return uuid == world.uuid && seed == world.seed && name.elementsEqual(world.name)
    }
    func tick(_ server: any Server) {
        for chunk in chunks_loaded {
            chunk.tick(server)
        }
        
        for entity in entities {
            entity.tick(server)
        }
        for entity in living_entities {
            entity.tick(server)
        }
        for entity in players {
            entity.tick(server)
        }
    }
    
    /*func save() {
        for chunk in chunks_loaded {
            chunk.save()
        }
        for entity in entities {
            entity.save()
        }
    }*/
}

public extension World {
    func serverTPSSlowed(to tps: UInt8, divisor: UInt16) {
        for entity in entities {
            entity.serverTPSSlowed(to: tps, divisor: divisor)
        }
        for entity in living_entities {
            entity.serverTPSSlowed(to: tps, divisor: divisor)
        }
        for entity in players {
            entity.serverTPSSlowed(to: tps, divisor: divisor)
        }
        for chunk in chunks_loaded {
            chunk.serverTPSSlowed(to: tps, divisor: divisor)
        }
    }
    func serverTPSIncreased(to tps: UInt8, multiplier: UInt16) {
        for entity in entities {
            entity.serverTPSIncreased(to: tps, multiplier: multiplier)
        }
        for entity in living_entities {
            entity.serverTPSIncreased(to: tps, multiplier: multiplier)
        }
        for entity in players {
            entity.serverTPSIncreased(to: tps, multiplier: multiplier)
        }
        for chunk in chunks_loaded {
            chunk.serverTPSIncreased(to: tps, multiplier: multiplier)
        }
    }
}

public extension World {
    func spawn_entity(_ entity: any Entity) {
        entities.append(entity)
    }
    func remove_entity(_ entity: any Entity) {
        let entity_uuid:UUID = entity.uuid
        guard let index:Int = entities.firstIndex(where: { $0.uuid == entity_uuid }) else { return }
        entities.remove(at: index)
    }
    func spawn_living_entity(_ entity: any LivingEntity) {
        living_entities.append(entity)
    }
    func remove_living_entity(_ entity: any LivingEntity) {
        let entity_uuid:UUID = entity.uuid
        guard let index:Int = living_entities.firstIndex(where: { $0.uuid == entity_uuid }) else { return }
        living_entities.remove(at: index)
    }
    
    func getNearbyEntities(center: any Location, x: Double, y: Double, z: Double) -> [any Entity] {
        return entities.filter({ $0.location.is_nearby(center: center, x_radius: x, y_radius: y, z_radius: z) })
    }
    func getNearbyEntities(center: any Location, x_radius: Double, y_radius: Double, z_radius: Double) -> [any Entity] {
        return entities.filter({ $0.location.is_nearby(center: center, x_radius: x_radius, y_radius: y_radius, z_radius: z_radius) })
    }
    
    func getEntity(uuid: UUID) -> (any Entity)? {
        return entities.first(where: { $0.uuid == uuid })
    }
    func getEntities(uuids: Set<UUID>) -> [any Entity] {
        return entities.filter({ uuids.contains($0.uuid) })
    }
    
    func getLivingEntity(uuid: UUID) -> (any LivingEntity)? {
        return living_entities.first(where: { $0.uuid == uuid })
    }
    func getLivingEntities(uuids: Set<UUID>) -> [any LivingEntity] {
        return living_entities.filter({ uuids.contains($0.uuid) })
    }
    
    func getPlayer(uuid: UUID) -> (any Player)? {
        return players.first(where: { $0.uuid == uuid })
    }
    func getPlayers(uuids: Set<UUID>) -> [any Player] {
        return players.filter({ uuids.contains($0.uuid) })
    }
}
