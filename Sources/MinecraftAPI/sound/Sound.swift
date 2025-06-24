//
//  Sound.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol Sound: MinecraftIdentifiable, Nameable {
    var categoryID: String { get }
}
