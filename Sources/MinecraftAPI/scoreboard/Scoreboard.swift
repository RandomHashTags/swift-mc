//
//  Scoreboard.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol Scoreboard {
    var objectives: [ScoreboardObjective] { get }
    var teams: [ScoreboardTeam] { get }
}
