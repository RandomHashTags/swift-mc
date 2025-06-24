//
//  Advancement.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

import Foundation

public protocol Advancement: MinecraftIdentifiable, Nameable {    
    var description: String { get }
    var criteria: [String] { get }
    var completed: Date? { get }
}