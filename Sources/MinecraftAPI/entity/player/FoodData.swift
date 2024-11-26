//
//  FoodData.swift
//
//
//  Created by Evan Anderson on 11/18/23.
//

public protocol FoodData : Tickable {
    var foodLevel : Int { get }
    var saturationLevel : Float { get }
    var exhaustionLevel : Float { get }
}
