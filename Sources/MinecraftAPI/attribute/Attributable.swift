//
//  Attributable.swift
//  
//
//  Created by Evan Anderson on 11/27/24.
//

public protocol Attributable {
    func getAttribute(_ attribute: any Attribute) -> (any AttributeActive)?
}