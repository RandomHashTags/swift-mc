//
//  MushroomCow.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

public protocol MushroomCow: Cow, Variantable {
    var milkedPotionEffects: [any PotionEffect] { get } // TODO: make Set
    var variant: any MushroomCowVariant { get }
}