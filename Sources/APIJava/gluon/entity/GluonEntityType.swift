//
//  GluonEntityType.swift
//
//
//  Created by Evan Anderson on 6/30/23.
//

import SwiftStringCatalogs

final class GluonEntityType : EntityType {
    let id:String
    let name:String
    
    let is_affected_by_gravity:Bool
    let is_damageable:Bool
    
    let receives_fall_damage:Bool
    
    var noDamageTicksMaximum:UInt16
    var fireTicksMaximum:UInt16
    var freezeTicksMaximum:UInt16
    
    init(
        id: String,
        name: String,
        is_affected_by_gravity: Bool,
        is_damageable: Bool,
        receives_fall_damage: Bool,
        noDamageTicksMaximum: UInt16,
        fireTicksMaximum: UInt16,
        freezeTicksMaximum: UInt16
    ) {
        self.id = id
        self.name = name
        self.is_affected_by_gravity = is_affected_by_gravity
        self.is_damageable = is_damageable
        self.receives_fall_damage = receives_fall_damage
        self.noDamageTicksMaximum = noDamageTicksMaximum
        self.fireTicksMaximum = fireTicksMaximum
        self.freezeTicksMaximum = freezeTicksMaximum
    }
}
