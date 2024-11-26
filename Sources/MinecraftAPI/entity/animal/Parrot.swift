//
//  Parrot.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

public protocol Parrot : Sittable, Tameable, Variantable {
    var isDancing : Bool { get }
    var variant : any ParrotVariant { get }
}