//
//  SoundCategory.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

import MinecraftUtilities

public protocol SoundCategory: Codable, MinecraftIdentifiable {
    var packetID: Int { get }
}