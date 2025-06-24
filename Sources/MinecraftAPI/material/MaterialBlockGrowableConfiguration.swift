//
//  MaterialBlockGrowableConfiguration.swift
//  
//
//  Created by Evan Anderson on 2/16/23.
//

public protocol MaterialBlockGrowableConfiguration {
    var maximumAge: UInt8 { get }
    var minimumLightLevelToGrow: UInt8 { get }
}
