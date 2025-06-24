//
//  ScoreboardTeam.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol ScoreboardTeam {
    var name: String { get }
    var displayName: String { get }
    var prefix: String? { get }
    var suffix: String? { get }
    
    var allowsFriendlyFire: Bool { get }
    var canSeeFriendlyInvisibles: Bool { get }
    
    var options: [ScoreboardTeamOption: ScoreboardTeamOption.Status] { get }
}
