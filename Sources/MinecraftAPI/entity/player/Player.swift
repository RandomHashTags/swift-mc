//
//  Player.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

import Logging

public protocol Player : LivingEntity, CommandSender, Permissible {
    var listName : String? { get }
    
    var experience : UInt64 { get }
    var experienceLevel : UInt64 { get }
    var foodData : any FoodData { get }
    
    var statistics : [String : any StatisticActive] { get }
    
    var gameMode : any GameMode { get }
    var isBlocking : Bool { get }
    var isFlying : Bool { get }
    var isOP : Bool { get }
    var isSneaking : Bool { get }
    var isSprinting : Bool { get }
    var lastSleptLocation : (any Location)? { get }
    
    var inventory : any PlayerInventory { get }
        
    func tickPlayer(_ server: any Server)
    
    func setGameMode(_ gameMode: any GameMode)
    
    func kick(reason: String)
    
    func consumed(item: inout any ItemStack)

    func sendChat(message: String)
}