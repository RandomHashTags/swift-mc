//
//  GluonItem.swift
//  
//
//  Created by Evan Anderson on 4/23/23.
//

/*
final class GluonItem : Item {
    var id:UInt64
    var uuid:UUID
    var typeID:String
    var type : (EntityType)? {
        return GluonServer.shared.get_entity_type(identifier: type_id)
    }
    var ticks_lived:UInt64
    let name:String
    var customName:String?
    var displayName:String?
    
    var boundaries:[Boundary]
    var location:any Location
    var velocity:Vector
    var fallDistance:Float
    var is_glowing:Bool
    var is_on_fire:Bool
    var is_on_ground:Bool
    
    var height:Float
    
    var fireTicks:UInt16
    var fireTicksMaximum:UInt16
    
    var freezeTicks:UInt16
    var freezeTicksMaximum:UInt16
    
    var passengerUUIDs:Set<UUID>
    var passengers : [any Entity] {
        return GluonServer.shared.getEntities(uuids: passengerUUIDs)
    }
    var vehicleUUID:UUID?
    var vehicle : (any Entity)? {
        guard let uuid:UUID = vehicleUUID else { return nil }
        return GluonServer.shared.getEntity(uuid: uuid)
    }
    
    var itemStack:ItemStack
    var pickupDelay:UInt8
    
    init(id: UInt64, uuid: UUID, type_id: String, ticks_lived: UInt64, name: String, customName: String? = nil, displayName: String? = nil, boundaries: [Boundary], location: any Location, velocity: Vector, fallDistance: Float, is_glowing: Bool, is_on_fire: Bool, is_on_ground: Bool, height: Float, fireTicks: UInt16, fireTicksMaximum: UInt16, freezeTicks: UInt16, freezeTicksMaximum: UInt16, passengerUUIDs: Set<UUID>, vehicleUUID: UUID? = nil, itemStack: ItemStack, pickupDelay: UInt8) {
        self.id = id
        self.uuid = uuid
        self.type_id = type_id
        self.ticks_lived = ticks_lived
        self.name = name
        self.customName = customName
        self.displayName = displayName
        self.boundaries = boundaries
        self.location = location
        self.velocity = velocity
        self.fallDistance = fallDistance
        self.is_glowing = is_glowing
        self.is_on_fire = is_on_fire
        self.is_on_ground = is_on_ground
        self.height = height
        self.fireTicks = fireTicks
        self.fireTicksMaximum = fireTicksMaximum
        self.freezeTicks = freezeTicks
        self.freezeTicksMaximum = freezeTicksMaximum
        self.passengerUUIDs = passengerUUIDs
        self.vehicleUUID = vehicleUUID
        self.itemStack = itemStack
        self.pickupDelay = pickupDelay
    }
    
    func tick(_ server: any Server) {
        tickItem(server)
    }
}
*/
