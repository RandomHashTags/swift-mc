//
//  AnimalBreedingConfiguration.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol AnimalBreedingConfiguration : Identifiable where ID == String {
    var breedItem : any ItemStack { get }
}
