//
//  Axolotl.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

public protocol Axolotl : Animal, Variantable {
    var isPlayingDead : Bool { get }
    var variant : any AxolotlVariant { get }
}