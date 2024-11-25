//
//  GameRule.swift
//  
//
//  Created by Evan Anderson on 2/4/23.
//

public protocol GameRule : Identifiable, Hashable {
    var value : ValueType { get }
}