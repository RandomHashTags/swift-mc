//
//  Permission.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol Permission : MinecraftIdentifiable {
    var children : Set<String> { get }
    var defaultValue : any PermissionDefaultValue { get }
}
