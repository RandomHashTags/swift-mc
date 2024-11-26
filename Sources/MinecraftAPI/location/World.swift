//
//  World.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

import Foundation

public protocol World : AnyObject, Hashable, Tickable {
    var uuid : UUID { get }
    var seed : Int64 { get }
    var name : String { get }
    
    var spawn_location : Vector { get }
    var difficulty : any Difficulty { get }
    var gameRules : [any GameRule] { get }
    var time : UInt64 { get }
    var border : WorldBorder? { get }
    
    var yMin : Int { get }
    var yMax : Int { get }
    var ySeaLevel : Int { get }
    
    var chunksLoaded : [any Chunk] { get }
    
    var allowsAnimals : Bool { get }
    var allowsMonsters : Bool { get }
    var allowsPVP : Bool { get }
    
    var bedsWork : Bool { get set}
    
    var entities : [any Entity] { get }
    var livingEntities : [any LivingEntity] { get }
    var players : [any Player] { get }
    
    func equals(_ world: any World) -> Bool
    func loadChunk(x: Int, z: Int) async
    func unloadChunk(x: Int, z: Int) async
    
    func spawnEntity(_ entity: any Entity)
    func removeEntity(_ entity: any Entity)
    
    func spawnLivingEntity(_ entity: any LivingEntity)
    func removeLivingEntity(_ entity: any LivingEntity)
    
    func getNearbyEntities(center: any Location, x: Double, y: Double, z: Double) -> [any Entity]
    func getNearbyEntities(center: any Location, xRadius: Double, yRadius: Double, zRadius: Double) -> [any Entity]
    
    func getEntity(uuid: UUID) -> (any Entity)?
    func getEntities(uuids: Set<UUID>) -> [any Entity]
    
    func getLivingEntity(uuid: UUID) -> (any LivingEntity)?
    func getLivingEntities(uuids: Set<UUID>) -> [any LivingEntity]
    
    func getPlayer(uuid: UUID) -> (any Player)?
    func getPlayers(uuids: Set<UUID>) -> [any Player]
}