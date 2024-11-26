//
//  DisplayNameable.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

public protocol DisplayNameable : Nameable {
    var displayName : String? { get }
}