//
//  Cat.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

public protocol Cat: Sittable, Tameable, Variantable {
    var collarColor: Color { get }
    var variant: any CatVariant { get }
}