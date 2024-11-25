//
//  MaterialConfiguration.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol MaterialConfiguration : Hashable, Identifiable {
    var isOnlyItem : Bool { get }
    var isOnlyBlock : Bool { get }
    var isBlockAndItem : Bool { get }
    
    var item : (any MaterialItemConfiguration)? { get }
    var block : (any MaterialBlockConfiguration)? { get }
}
public extension MaterialConfiguration {
    var isOnlyItem : Bool { item != nil && block == nil }
    var isOnlyBlock : Bool { item == nil && block != nil }
    var isBlockAndItem : Bool { item != nil && block != nil }
}

public extension MaterialConfiguration {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
