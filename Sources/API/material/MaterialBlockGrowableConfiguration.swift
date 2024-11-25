//
//  MaterialBlockGrowableConfiguration.swift
//  
//
//  Created by Evan Anderson on 2/16/23.
//

public protocol MaterialBlockGrowableConfiguration {
    var maximum_age : UInt8 { get }
    var minimum_light_level_to_grow : UInt8 { get }
}
