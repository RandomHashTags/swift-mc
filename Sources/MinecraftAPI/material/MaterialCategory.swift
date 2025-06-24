//
//  MaterialCategory.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol MaterialCategory: MinecraftIdentifiable, Nameable {
    var configuration: any MaterialConfiguration { get }
}