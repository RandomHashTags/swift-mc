//
//  BiomeConfiguration.swift
//  
//
//  Created by Evan Anderson on 2/4/23.
//

public protocol BiomeConfiguration : Identifiable, Hashable {
    var temperature : Float { get }
    var temperatureStartingY : Int { get }
    var temperatureEndingY : Int { get }
    var temperatureDropRate : Float { get }
    
    var downfall : Float { get }
}