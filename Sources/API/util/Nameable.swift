//
//  Nameable.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol Nameable {
    var name : String { get }
    var customName : String? { get set }
    var displayName : String? { get set }
}
public extension Nameable {
    var hasCustomName : Bool { customName != nil }
    
    var displayName : String? { nil }
}
