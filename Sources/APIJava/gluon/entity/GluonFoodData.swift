//
//  GluonFoodData.swift
//
//
//  Created by RandomHashTags on 11/24/23.
//

struct GluonFoodData : FoodData {
    var food_level:Int
    var saturation_level:Float
    var exhaustion_level:Float
    
    mutating func tick(_ server: Server) {
        // TODO: fix
    }
    
    mutating func serverTPSSlowed(to tps: UInt8, divisor: UInt16) {
        // TODO: fix
    }
    
    mutating func serverTPSIncreased(to tps: UInt8, multiplier: UInt16) {
        // TODO: fix
    }
}
