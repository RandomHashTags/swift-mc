//
//  GluonEntityDeathEvent.swift
//  
//
//  Created by Evan Anderson on 5/6/23.
//

struct GluonEntityDeathEvent : EntityDeathEvent {
    let type:any EventType = GluonEventType.entity_death
    var entity:any Entity
    
    init(entity: any Entity) {
        self.entity = entity
    }
}
