//
//  Art.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol Art : MinecraftIdentifiable {
    /// Measured in blocks.
    var width : Int { get }
    
    /// Measured in blocks.
    var height : Int { get }
}
