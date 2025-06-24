//
//  EnderDragonBattle.swift
//  
//
//  Created by Evan Anderson on 11/27/24.
//

public protocol EnderDragonBattle {
    var bossBar: any BossBar { get }
    var enderDragon: any EnderDragon { get }
    var endPortalLocation: (any Location)? { get }
    var previouslySlain: Int { get }
    var respawnPhase: any EnderDragonBattleRespawnPhase { get }

    func respawn()
    func tryRespawning(with crystals: [any EnderCrystal]) -> Bool // TODO: make Set
}