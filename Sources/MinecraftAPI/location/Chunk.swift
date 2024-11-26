//
//  Chunk.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol Chunk : AnyObject, Tickable {
    var world : any World { get }
    var x : Int { get }
    var z : Int { get }
    
    var blocks:[any Block] { get set }
    
    init(world: any World, x: Int, z: Int)
    
    var entities : [any Entity] { get }
    var livingEntities : [any LivingEntity] { get }
    var players : [any Player] { get }
    
    func load() async
    func unload() async
}

public extension Chunk {
    func tick(_ server: Server) {
    }
    
    func serverTPSSlowed(to tps: Int, divisor: Int) {
        for block in blocks {
            block.serverTPSSlowed(to: tps, divisor: divisor)
        }
    }
    func serverTPSIncreased(to tps: Int, multiplier: Int) {
        for block in blocks {
            block.serverTPSIncreased(to: tps, multiplier: multiplier)
        }
    }
}

public extension Chunk {
    static func == (lhs: any Chunk, rhs: any Chunk) -> Bool {
        return lhs.world.equals(rhs.world) && lhs.x == rhs.x && lhs.z == rhs.z
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(world)
        hasher.combine(x)
        hasher.combine(z)
    }
    
    /*
    mutating func load() async {
        let seed:Int64 = world.seed
    }
    mutating func unload() async {
        save()
        
        for index in world.entities.indices {
            world.entities[index].save()
        }
        for index in world.livingEntities.indices {
            world.livingEntities[index].save()
        }
        for index in world.players.indices {
            world.players[index].save()
        }
        
        for index in world.entities.indices {
            world.entities[index].remove()
        }
        for index in world.livingEntities.indices {
            world.livingEntities[index].remove()
        }
        for index in world.players.indices {
            world.players[index].remove()
        }
        
    }*/
}
