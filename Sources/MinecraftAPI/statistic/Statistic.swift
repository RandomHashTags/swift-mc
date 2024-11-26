//
//  Statistic.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol Statistic : MinecraftIdentifiable, Nameable {
    var categories : [any StatisticCategory] { get }
    var value : ValueType { get }
}
