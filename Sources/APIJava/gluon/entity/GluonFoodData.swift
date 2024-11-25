//
//  GluonFoodData.swift
//
//
//  Created by RandomHashTags on 11/24/23.
//

struct GluonFoodData : FoodData {
    var foodLevel:Int
    var saturationLevel:Float
    var exhaustionLevel:Float
    
    mutating func tick(_ server: Server) {
        // TODO: fix
    }
    
    mutating func serverTPSSlowed(to tps: Int, divisor: Int) {
        // TODO: fix
    }
    
    mutating func serverTPSIncreased(to tps: Int, multiplier: Int) {
        // TODO: fix
    }
}
