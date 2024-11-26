//
//  GameRule.swift
//  
//
//  Created by Evan Anderson on 2/4/23.
//

public protocol GameRule : Hashable, Identifiable where ID == String {
    var value : ValueType { get }
}