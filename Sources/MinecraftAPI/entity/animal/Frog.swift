//
//  Frog.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

public protocol Frog : Animal, Variantable {
    var tongueTarget : (any Entity)? { get }
    var variant : any FrogVariant { get }
}