//
//  GluonEntity.swift
//  
//
//  Created by Evan Anderson on 4/23/23.
//

/*
final class GluonEntity : Entity {
    let id:UInt64
    let uuid:UUID
    let typeID:String
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
    
    func tick(_ server: any Server) {
        tickEntity(server)
    }
    
    init(id: UInt64, uuid: UUID, type_id: String, ticks_lived: UInt64, name: String, customName: String? = nil, displayName: String? = nil, boundaries: [Boundary], location: any Location, velocity: Vector, fallDistance: Float, is_glowing: Bool, is_on_fire: Bool, is_on_ground: Bool, height: Float, fireTicks: UInt16, fireTicksMaximum: UInt16, freezeTicks: UInt16, freezeTicksMaximum: UInt16, passengerUUIDs: Set<UUID>, vehicleUUID: UUID? = nil) {
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
    }
    
    /*init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: EntityCodingKeys.self)
        self.uuid = try container.decode(UUID.self, forKey: .uuid)
        let type_identifier:String = try container.decode(String.self, forKey: .type)
        self.type = GluonServer.shared.get_entity_type(identifier: type_identifier)!
        self.ticks_lived = try container.decode(UInt64.self, forKey: .ticks_lived)
        self.customName = try container.decodeIfPresent(String.self, forKey: .customName)
        self.displayName = try container.decodeIfPresent(String.self, forKey: .displayName)
        self.boundaries = try container.decode([Boundary].self, forKey: .boundaries)
        self.location = try container.decode(GluonEntity.TargetLocation.self, forKey: .location)
        self.velocity = try container.decode(Vector.self, forKey: .velocity)
        self.fallDistance = try container.decode(Float.self, forKey: .fallDistance)
        self.is_glowing = try container.decode(Bool.self, forKey: .is_glowing)
        self.is_on_fire = try container.decode(Bool.self, forKey: .is_on_fire)
        self.is_on_ground = try container.decode(Bool.self, forKey: .is_on_ground)
        self.height = try container.decode(Float.self, forKey: .height)
        self.fireTicks = try container.decode(UInt16.self, forKey: .fireTicks)
        self.fireTicksMaximum = try container.decode(UInt16.self, forKey: .fireTicksMaximum)
        self.freezeTicks = try container.decode(UInt16.self, forKey: .freezeTicks)
        self.freezeTicksMaximum = try container.decode(UInt16.self, forKey: .freezeTicksMaximum)
        self.passengerUUIDs = try container.decode(Set<UUID>.self, forKey: .passengerUUIDs)
        self.vehicleUUID = try container.decodeIfPresent(UUID.self, forKey: .vehicleUUID)
    }*/
}

extension Entity {
    func remove() { // TODO: fix
    }
    func teleport(_ location: any Location) { // TODO: fix
    }
}

extension GluonEntity {
    func remove() {
        location.world.removeEntity(self)
    }
    func teleport(_ location: any Location) {
        let event:GluonEntityTeleportEvent = GluonEntityTeleportEvent(entity: self, newLocation: location)
        GluonServer.shared.callEvent(event: event)
        guard !event.isCancelled else { return }
        self.location = location
    }
}
*/
