//
//  FoodData.swift
//
//
//  Created by Evan Anderson on 11/18/23.
//

public protocol FoodData : Tickable {
    var foodLevel : Int { get set }
    var saturationLevel : Float { get set }
    var exhaustionLevel : Float { get set }
}
