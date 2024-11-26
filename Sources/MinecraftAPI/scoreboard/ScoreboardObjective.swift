//
//  ScoreboardObjective.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol ScoreboardObjective {
    var name : String { get }
    var displayName : String { get }
    var criteria : String { get }
}
