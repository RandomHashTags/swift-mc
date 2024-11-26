//
//  AttributeActive.swift
//
//
//  Created by Evan Anderson on 6/30/23.
//

public protocol AttributeActive : Hashable {
    var attribute_id : String { get }
    var attribute : (any Attribute)? { get }
    
    var value : Double { get }
}
