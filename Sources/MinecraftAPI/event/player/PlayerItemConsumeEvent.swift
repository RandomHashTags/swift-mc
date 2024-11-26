//
//  PlayerItemConsumeEvent.swift
//  
//
//  Created by Evan Anderson on 3/8/23.
//

public protocol PlayerItemConsumeEvent : PlayerEvent, Cancellable {
    var item : any ItemStack { get }
    
    init(player: any Player, item: inout any ItemStack)
}
