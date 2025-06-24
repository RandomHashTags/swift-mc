//
//  LivingEntityBreedEvent.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

public protocol LivingEntityBreedEvent: LivingEntityEventCancellable {
    var breeder: (any LivingEntity)? { get }
    var experience: Int { get }
    var father: any LivingEntity { get }
    var item: (any ItemStack)? { get }
    var mother: any LivingEntity { get }
}