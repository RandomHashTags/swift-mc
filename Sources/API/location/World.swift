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
    var difficulty : any Difficulty { get set }
    var gameRules : [any GameRule] { get set }
    var time : UInt64 { get set }
    var border : WorldBorder? { get set }
    
    var yMin : Int { get set }
    var yMax : Int { get set }
    var ySeaLevel : Int { get set }
    
    var chunksLoaded : [any Chunk] { get set }
    
    var allowsAnimals : Bool { get set }
    var allowsMonsters : Bool { get set }
    var allowsPVP : Bool { get set }
    
    var bedsWork : Bool { get set}
    
    var entities : [any Entity] { get set }
    var livingEntities : [any LivingEntity] { get set }
    var players : [any Player] { get }
    
    func equals(_ world: any World) -> Bool
    func loadChunk(x: Int, z: Int) async
    func unloadChunk(x: Int, z: Int) async
    
    func spawnEntity(_ entity: any Entity)
    func removeEntity(_ entity: any Entity)
    
    func spawnLivingEntity(_ entity: any LivingEntity)
    func removeLivingEntity(_ entity: any LivingEntity)
    
    func getNearbyEntities(center: any Location, x: Double, y: Double, z: Double) -> [any Entity]
    func getNearbyEntities(center: any Location, xRadius: Double, yRadius: Double, zRadius: Double) -> [any Entity]
    
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
        for chunk in chunksLoaded {
            chunk.tick(server)
        }
        
        for entity in entities {
            entity.tick(server)
        }
        for entity in livingEntities {
            entity.tick(server)
        }
        for entity in players {
            entity.tick(server)
        }
    }
    
    /*func save() {
        for chunk in chunksLoaded {
            chunk.save()
        }
        for entity in entities {
            entity.save()
        }
    }*/
}

public extension World {
    func serverTPSSlowed(to tps: Int, divisor: Int) {
        for entity in entities {
            entity.serverTPSSlowed(to: tps, divisor: divisor)
        }
        for entity in livingEntities {
            entity.serverTPSSlowed(to: tps, divisor: divisor)
        }
        for entity in players {
            entity.serverTPSSlowed(to: tps, divisor: divisor)
        }
        for chunk in chunksLoaded {
            chunk.serverTPSSlowed(to: tps, divisor: divisor)
        }
    }
    func serverTPSIncreased(to tps: Int, multiplier: Int) {
        for entity in entities {
            entity.serverTPSIncreased(to: tps, multiplier: multiplier)
        }
        for entity in livingEntities {
            entity.serverTPSIncreased(to: tps, multiplier: multiplier)
        }
        for entity in players {
            entity.serverTPSIncreased(to: tps, multiplier: multiplier)
        }
        for chunk in chunksLoaded {
            chunk.serverTPSIncreased(to: tps, multiplier: multiplier)
        }
    }
}

public extension World {
    func spawnEntity(_ entity: any Entity) {
        entities.append(entity)
    }
    func removeEntity(_ entity: any Entity) {
        let entity_uuid:UUID = entity.uuid
        guard let index:Int = entities.firstIndex(where: { $0.uuid == entity_uuid }) else { return }
        entities.remove(at: index)
    }
    func spawnLivingEntity(_ entity: any LivingEntity) {
        livingEntities.append(entity)
    }
    func removeLivingEntity(_ entity: any LivingEntity) {
        let entity_uuid:UUID = entity.uuid
        guard let index:Int = livingEntities.firstIndex(where: { $0.uuid == entity_uuid }) else { return }
        livingEntities.remove(at: index)
    }
    
    func getNearbyEntities(center: any Location, x: Double, y: Double, z: Double) -> [any Entity] {
        return entities.filter({ $0.location.is_nearby(center: center, xRadius: x, yRadius: y, zRadius: z) })
    }
    func getNearbyEntities(center: any Location, xRadius: Double, yRadius: Double, zRadius: Double) -> [any Entity] {
        return entities.filter({ $0.location.is_nearby(center: center, xRadius: xRadius, yRadius: yRadius, zRadius: zRadius) })
    }
    
    func getEntity(uuid: UUID) -> (any Entity)? {
        return entities.first(where: { $0.uuid == uuid })
    }
    func getEntities(uuids: Set<UUID>) -> [any Entity] {
        return entities.filter({ uuids.contains($0.uuid) })
    }
    
    func getLivingEntity(uuid: UUID) -> (any LivingEntity)? {
        return livingEntities.first(where: { $0.uuid == uuid })
    }
    func getLivingEntities(uuids: Set<UUID>) -> [any LivingEntity] {
        return livingEntities.filter({ uuids.contains($0.uuid) })
    }
    
    func getPlayer(uuid: UUID) -> (any Player)? {
        return players.first(where: { $0.uuid == uuid })
    }
    func getPlayers(uuids: Set<UUID>) -> [any Player] {
        return players.filter({ uuids.contains($0.uuid) })
    }
}
