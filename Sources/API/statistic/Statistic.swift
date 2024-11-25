//
//  Statistic.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol Statistic : Identifiable, MultilingualName {
    var value : ValueType { get }
}
