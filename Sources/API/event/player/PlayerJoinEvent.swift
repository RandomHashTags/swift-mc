//
//  PlayerJoinEvent.swift
//  
//
//  Created by Evan Anderson on 2/4/23.
//

public protocol PlayerJoinEvent : PlayerEvent {
    init(_ player: any Player)
}
