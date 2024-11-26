//
//  Wolf.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

public protocol Wolf : Sittable, Tameable, Variantable {
    var collarColor : Color { get }
    var tailAngle : Float { get }
    var isAngry : Bool { get }
    var isInterested : Bool { get }
    var isWet : Bool { get }
    var variant : any WolfVariant { get }
}