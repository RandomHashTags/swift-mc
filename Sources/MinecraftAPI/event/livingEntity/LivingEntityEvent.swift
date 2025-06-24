//
//  LivingEntityEvent.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

public protocol LivingEntityEvent: Event {
    var entity: any LivingEntity { get }
}