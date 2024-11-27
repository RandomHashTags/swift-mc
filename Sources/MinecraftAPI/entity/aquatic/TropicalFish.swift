//
//  TropicalFish.swift
//  
//
//  Created by Evan Anderson on 11/27/24.
//

public protocol TropicalFish : Fish {
    var bodyColor : Color { get }
    var patternColor : Color { get }
    var variant : any TropicalFishVariant { get }
}