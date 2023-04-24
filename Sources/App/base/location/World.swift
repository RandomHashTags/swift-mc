//
//  World.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

import Foundation
import huge_numbers

public protocol World : Jsonable, Tickable {
    associatedtype TargetChunk : Chunk
    associatedtype TargetEntity : Entity
    associatedtype TargetLivingEntity : LivingEntity
    associatedtype TargetPlayer : Player
    associatedtype TargetLocation : Location
    
    var uuid : UUID { get }
    var seed : Int64 { get }
    var name : String { get }
    
    var spawn_location : Vector { get set }
    var difficulty : Difficulty { get set }
    var game_rules : Set<GameRule> { get set }
    var time : UInt64 { get set }
    var border : WorldBorder? { get set }
    
    var y_min : HugeFloat { get set }
    var y_max : HugeFloat { get set }
    var y_sea_level : HugeFloat { get set }
    
    var chunks_loaded : Set<TargetChunk> { get set }
    
    var allows_animals : Bool { get set }
    var allows_monsters : Bool { get set }
    var allows_pvp : Bool { get set }
    
    var beds_work : Bool { get set}
    
    var entities : Set<TargetEntity> { get set }
    var living_entities : Set<TargetLivingEntity> { get set }
    var players : Set<TargetPlayer> { get set }
    
    func equals(_ world: any World) -> Bool
    mutating func load_chunk(x: HugeInt, z: HugeInt) async
    mutating func unload_chunk(x: HugeInt, z: HugeInt) async
    
    mutating func spawn_entity(_ entity: TargetEntity)
    mutating func remove_entity(_ entity: TargetEntity)
    
    func get_nearby_entities(center: TargetLocation, x: Double, y: Double, z: Double) -> [TargetEntity]
    func get_nearby_entities(center: TargetLocation, x_radius: Double, y_radius: Double, z_radius: Double) -> [TargetEntity]
    
    func get_entity(uuid: UUID) -> TargetEntity?
    func get_entities(uuids: Set<UUID>) -> [TargetEntity]
    
    func get_living_entity(uuid: UUID) -> TargetLivingEntity?
    func get_living_entities(uuids: Set<UUID>) -> [TargetLivingEntity]
    
    func get_player(uuid: UUID) -> TargetPlayer?
    func get_players(uuids: Set<UUID>) -> [TargetPlayer]
}

public extension World {
    static func == (lhs: any World, rhs: any World) -> Bool {
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
    mutating func tick(_ server: any Server) {
        for chunk in chunks_loaded {
            chunk.tick(server)
        }
        
        for entity in entities {
            entity.tick(server)
        }
    }
    
    func save() {
        for chunk in chunks_loaded {
            chunk.save()
        }
        for entity in entities {
            entity.save()
        }
    }
    
    mutating func spawn_entity(_ entity: TargetEntity) {
        entities.insert(entity)
    }
    mutating func remove_entity(_ entity: TargetEntity) {
        entities.remove(entity)
    }
    
    func get_nearby_entities(center: TargetLocation, x: Double, y: Double, z: Double) -> [TargetEntity] {
        return entities.filter({ $0.location.is_nearby(center: center, x_radius: x, y_radius: y, z_radius: z) })
    }
    func get_nearby_entities(center: TargetLocation, x_radius: Double, y_radius: Double, z_radius: Double) -> [TargetEntity] {
        return entities.filter({ $0.location.is_nearby(center: center, x_radius: x_radius, y_radius: y_radius, z_radius: z_radius) })
    }
    
    func get_entity(uuid: UUID) -> TargetEntity? {
        return entities.first(where: { $0.uuid == uuid })
    }
    func get_entities(uuids: Set<UUID>) -> [TargetEntity] {
        return entities.filter({ uuids.contains($0.uuid) })
    }
    
    func get_living_entity(uuid: UUID) -> TargetLivingEntity? {
        return living_entities.first(where: { $0.uuid == uuid })
    }
    func get_living_entities(uuids: Set<UUID>) -> [TargetLivingEntity] {
        return living_entities.filter({ uuids.contains($0.uuid) })
    }
    
    func get_player(uuid: UUID) -> TargetPlayer? {
        return players.first(where: { $0.uuid == uuid })
    }
    func get_players(uuids: Set<UUID>) -> [TargetPlayer] {
        return players.filter({ uuids.contains($0.uuid) })
    }
}
