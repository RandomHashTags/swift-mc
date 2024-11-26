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
    
    var blocks:[any Block] { get }
    
    init(world: any World, x: Int, z: Int)
    
    var entities : [any Entity] { get }
    var livingEntities : [any LivingEntity] { get }
    var players : [any Player] { get }
    
    func load() async
    func unload() async
}

public extension Chunk {
    var livingEntities : [any LivingEntity] { entities.compactMap({ $0 as? any LivingEntity })}
    var players : [any Player] { livingEntities.compactMap({ $0 as? any Player }) }
}