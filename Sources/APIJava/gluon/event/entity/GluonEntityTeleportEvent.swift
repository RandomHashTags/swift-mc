//
//  GluonEntityTeleportEvent.swift
//  
//
//  Created by Evan Anderson on 5/6/23.
//

struct GluonEntityTeleportEvent : EntityTeleportEvent {
    let type:any EventType = GluonEventType.entity_teleport
    var entity:any Entity
    var newLocation:any Location
    var isCancelled:Bool = false
    
    init(entity: any Entity, newLocation: any Location) {
        self.entity = entity
        self.newLocation = newLocation
    }
}
