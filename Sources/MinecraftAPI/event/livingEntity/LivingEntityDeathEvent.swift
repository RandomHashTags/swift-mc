//
//  LivingEntityDeathEvent.swift
//  
//
//  Created by Evan Anderson on 2/22/23.
//

public protocol LivingEntityDeathEvent : LivingEntityEvent {
    var damageSource : any DamageSource { get }
    var droppedExp : Int { get }
    var drops : [any ItemStack] { get }
}
