//
//  AnimalBreedingConfiguration.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol AnimalBreedingConfiguration : Identifiable {
    var breedItem : any ItemStack { get }
}
