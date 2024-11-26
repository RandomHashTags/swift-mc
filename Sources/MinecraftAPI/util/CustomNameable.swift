//
//  CustomNameable.swift
//  
//
//  Created by Evan Anderson on 11/26/23.
//

public protocol CustomNameable : Nameable {
    var customName : String? { get }
}