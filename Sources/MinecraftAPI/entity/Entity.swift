//
//  Entity.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

import Foundation

public protocol Entity : AnyObject, Hashable, CustomNameable, DisplayNameable, Tickable {
    var id : UInt64 { get }
    var uuid : UUID { get }
    /// the ``EntityType`` id
    var typeID : String { get }
    var type : (any EntityType)? { get }
    
    var ticks_lived : UInt64 { get set }
    
    var boundaries : [Boundary] { get set }
    /// The current location of this entity.
    var location : any Location { get set }
    /// The current velocity of this entity.
    var velocity : Vector { get set }
    /// The total fall distance of this entity, measured in blocks.
    var fallDistance : Float { get set }
    
    var is_glowing : Bool { get set }
    var is_on_fire : Bool { get set }
    var is_on_ground : Bool { get set }
    
    var height : Float { get set }
    
    var fireTicks : Int { get set }
    var fireTicksMaximum : Int { get set }
    
    var freezeTicks : Int { get set }
    var freezeTicksMaximum : Int { get set }
    
    /// The UUIDs of the entities currently riding this entity.
    var passengerUUIDs : Set<UUID> { get set }
    var passengers : [any Entity] { get }
    
    /// The vehicle UUID this entity is currently riding.
    var vehicleUUID : UUID? { get set }
    var vehicle : (any Entity)? { get }
        
    func tickEntity(_ server: any Server)
    
    /// Removes this entity from the server. Like it never existed (or "despawned").
    func remove()
    
    /// Teleport this entity to a certain location.
    func teleport(_ location: any Location)
}

public extension Entity {
    static func == (lhs: any Entity, rhs: any Entity) -> Bool {
        return lhs.uuid == rhs.uuid && lhs.typeID == rhs.typeID
    }
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.uuid == rhs.uuid && lhs.typeID == rhs.typeID
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
        hasher.combine(typeID)
    }
    
    func tick(_ server: any Server) {
        tickEntity(server)
    }
    func tickEntity(_ server: any Server) {
        default_tick_entity(server)
    }
    func default_tick_entity(_ server: any Server) {
        //ServerMojang.instance.logger.info("Entity;default_tick_entity;entity with uuid \(uuid) has been ticked")
        ticks_lived += 1
        
        if let type:any EntityType = type, type.isAffectedByGravity && !is_on_ground {
            let newLocation:Double = location.y - server.gravityPerTick
            // TODO: check distance to closest block at Y position
            location.y = newLocation
        }
    }
    
    func serverTPSSlowed(to tps: Int, divisor: Int) {
        fireTicks /= divisor
        fireTicksMaximum /= divisor
        
        freezeTicks /= divisor
        freezeTicksMaximum /= divisor
    }
    func serverTPSIncreased(to tps: Int, multiplier: Int) {
        fireTicks *= multiplier
        fireTicksMaximum *= multiplier
        
        freezeTicks *= multiplier
        freezeTicksMaximum *= multiplier
    }
}

public enum EntityCodingKeys : CodingKey {
    case uuid
    case type_id
    case ticks_lived
    case customName
    case displayName
    case boundaries
    case location
    case velocity
    case fallDistance
    case is_glowing
    case is_on_fire
    case is_on_ground
    case height
    case fireTicks
    case fireTicksMaximum
    case freezeTicks
    case freezeTicksMaximum
    case passengerUUIDs
    case vehicleUUID
}
