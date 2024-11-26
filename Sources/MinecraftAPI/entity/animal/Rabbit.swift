//
//  Rabbit.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

public protocol Rabbit : Animal, Variantable {
    var variant : any RabbitVariant { get }
}