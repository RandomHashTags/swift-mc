//
//  Permission.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol Permission: MinecraftIdentifiable {
    /// The child permissions granted when they have this permission.
    var children: Set<String> { get }
    var defaultValue: any PermissionDefaultValue { get }
}
