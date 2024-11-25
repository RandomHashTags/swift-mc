//
//  Item.swift
//  
//
//  Created by Evan Anderson on 2/16/23.
//

public protocol Item : Entity {
    var itemStack : any ItemStack { get set }
    var pickupDelay : UInt8 { get set }
    
    func tickItem(_ server: any Server)
}
public extension Item {
    func tick(_ server: any Server) {
        tickItem(server)
    }
    func tickItem(_ server: any Server) {
        defaultTickItem(server)
    }
    func defaultTickItem(_ server: any Server) {
        tickEntity(server)
        
        if fireTicks > 0 || ticks_lived >= UInt64(server.ticksPerSecond) * 60 * 5 {
            remove()
            return
        }
    }
}
