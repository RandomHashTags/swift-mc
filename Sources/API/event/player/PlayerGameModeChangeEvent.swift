//
//  PlayerGameModeChangeEvent.swift
//  
//
//  Created by Evan Anderson on 2/22/23.
//

public protocol PlayerGameModeChangeEvent : PlayerEventCancellable {
    var newGameMode : any GameMode { get set }
}
