//
//  GluonMaterialBlockLiquidConfiguration.swift
//  
//
//  Created by Evan Anderson on 4/23/23.
//

final class GluonMaterialBlockLiquidConfiguration : MaterialBlockLiquidConfiguration {
    var distancesPerTick:[String:Double]
    
    init(distancesPerTick: [String:Double]) {
        self.distancesPerTick = distancesPerTick
    }
}
