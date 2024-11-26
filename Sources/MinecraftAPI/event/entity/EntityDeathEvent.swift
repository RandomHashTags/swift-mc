//
//  EntityDeathEvent.swift
//  
//
//  Created by Evan Anderson on 2/22/23.
//

public protocol EntityDeathEvent : EntityEvent {
    init(entity: any Entity)
}
