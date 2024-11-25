//
//  Player.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

import Logging

public protocol Player : LivingEntity, CommandSender, Permissible {
    var listName : String? { get set }
    
    var experience : UInt64 { get set }
    var experienceLevel : UInt64 { get set }
    var foodData : any FoodData { get set }
    
    var statistics : [String : any StatisticActive] { get set }
    
    var gameMode : any GameMode { get set }
    var isBlocking : Bool { get set }
    var isFlying : Bool { get set }
    var isOP : Bool { get set }
    var isSneaking : Bool { get set }
    var isSprinting : Bool { get set }
    var lastSleptLocation : (any Location)? { get set }
    
    var inventory : any PlayerInventory { get set }
        
    func tickPlayer(_ server: any Server)
    
    func setGameMode(_ gameMode: any GameMode)
    
    func kick(reason: String)
    
    func consumed(item: inout any ItemStack)
}

public extension Player {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.uuid == rhs.uuid && lhs.name.elementsEqual(rhs.name)
    }
    
    func tick(_ server: any Server) {
        tickPlayer(server)
    }
    func tickPlayer(_ server: any Server) {
        defaultTickPlayer(server)
    }
    func defaultTickPlayer(_ server: any Server) {
        //ServerMojang.instance.logger.info(Logger.Message(stringLiteral: "Player;defaultTickPlayer;player " + name + " has been ticked"))
        tickLivingEntity(server)
    }
    
    func hasPermission(_ permission: String) -> Bool {
        return permissions.contains(permission)
    }
}

public extension Player {
    func serverTPSSlowed(to tps: Int, divisor: Int) {
        playerServerTPSSlowed(to: tps, divisor: divisor)
    }
    internal func playerServerTPSSlowed(to tps: Int, divisor: Int) {
        playerServerTPSIncreased(to: tps, multiplier: divisor)
    }
    
    func serverTPSIncreased(to tps: Int, multiplier: Int) {
        playerServerTPSIncreased(to: tps, multiplier: multiplier)
    }
    internal func playerServerTPSIncreased(to tps: Int, multiplier: Int) {
        living_entity_server_tps_increased(to: tps, multiplier: multiplier)
    }
}
