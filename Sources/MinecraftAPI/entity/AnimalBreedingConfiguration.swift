//
//  AnimalBreedingConfiguration.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol AnimalBreedingConfiguration: MinecraftIdentifiable {
    var breedItem: any ItemStack { get }
}
