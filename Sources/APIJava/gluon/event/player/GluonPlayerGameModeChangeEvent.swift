//
//  GluonPlayerGameModeChangeEvent.swift
//  
//
//  Created by Evan Anderson on 5/6/23.
//

struct GluonPlayerGameModeChangeEvent : PlayerGameModeChangeEvent {
    let type:any EventType = GluonEventType.player_change_game_mode
    var player:any Player
    var newGameMode:GameMode
    var isCancelled:Bool = false
    
    init(player: any Player, newGameMode: GameMode) {
        self.player = player
        self.newGameMode = newGameMode
    }
}
