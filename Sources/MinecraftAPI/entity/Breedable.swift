//
//  Breedable.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

public protocol Breedable : Ageable {
    var canBreed : Bool { get }
    var isAgeLocked : Bool { get }
}