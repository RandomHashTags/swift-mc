//
//  LivingEntityPartable.swift
//  
//
//  Created by Evan Anderson on 11/27/24.
//

public protocol LivingEntityPartable : LivingEntity {
    var parts : [any EntityPart] { get } // TODO: make Set
}