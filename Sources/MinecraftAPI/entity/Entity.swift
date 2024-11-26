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
    
    var ticksLived : UInt64 { get }
    
    var boundaries : [Boundary] { get }
    /// The current location of this entity.
    var location : any Location { get }
    /// The current velocity of this entity.
    var velocity : Vector { get }
    /// The total fall distance of this entity, measured in blocks.
    var fallDistance : Float { get }
    
    var isGlowing : Bool { get }
    var isOnFire : Bool { get }
    var isOnGround : Bool { get }
    
    var height : Float { get }
    
    var fireTicks : Int { get }
    var fireTicksMaximum : Int { get }
    
    var freezeTicks : Int { get }
    var freezeTicksMaximum : Int { get }
    
    /// The UUIDs of the entities currently riding this entity.
    var passengerUUIDs : Set<UUID> { get }
    var passengers : [any Entity] { get }
    
    /// The vehicle UUID this entity is currently riding.
    var vehicleUUID : UUID? { get }
    var vehicle : (any Entity)? { get }
        
    func tickEntity(_ server: any Server)
    
    /// Removes this entity from the server. Like it never existed (or "despawned").
    func remove()
    
    /// Teleport this entity to a certain location.
    func teleport(_ location: any Location)
}