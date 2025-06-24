//
//  StatisticActive.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol StatisticActive: Codable, MinecraftIdentifiable {
    var type: (any Statistic)? { get }
    var value: Float { get }
}
