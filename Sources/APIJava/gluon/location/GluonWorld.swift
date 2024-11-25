//
//  GluonWorld.swift
//  
//
//  Created by Evan Anderson on 4/23/23.
//

import API
import Foundation

final class GluonWorld : World {
    let uuid:UUID
    let seed:Int64
    let name:String
    
    var spawn_location:Vector
    var difficulty:any Difficulty
    var gameRules:[any GameRule]
    var time:UInt64
    var border:WorldBorder?
    
    var yMin:Int
    var yMax:Int
    var ySeaLevel:Int
    var chunksLoaded:[any Chunk]
    
    var allowsAnimals:Bool
    var allowsMonsters:Bool
    var allowsPVP:Bool
    var bedsWork:Bool
    
    var entities:[any Entity]
    var livingEntities:[any LivingEntity]
    var players:[any Player]
    
    init(
        uuid: UUID,
        seed: Int64,
        name: String,
        spawn_location: Vector,
        difficulty: any Difficulty,
        gameRules: [any GameRule],
        time: UInt64,
        border: WorldBorder? = nil,
        yMin: Int,
        yMax: Int,
        ySeaLevel: Int,
        chunksLoaded: [any Chunk],
        allowsAnimals: Bool,
        allowsMonsters: Bool,
        allowsPVP: Bool,
        bedsWork: Bool,
        entities: [any Entity],
        livingEntities: [any LivingEntity],
        players: [any Player]
    ) {
        self.uuid = uuid
        self.seed = seed
        self.name = name
        self.spawn_location = spawn_location
        self.difficulty = difficulty
        self.gameRules = gameRules
        self.time = time
        self.border = border
        self.yMin = yMin
        self.yMax = yMax
        self.ySeaLevel = ySeaLevel
        self.chunksLoaded = chunksLoaded
        self.allowsAnimals = allowsAnimals
        self.allowsMonsters = allowsMonsters
        self.allowsPVP = allowsPVP
        self.bedsWork = bedsWork
        self.entities = entities
        self.livingEntities = livingEntities
        self.players = players
    }
    
    func loadChunk(x: Int, z: Int) async {
        let chunk:any Chunk = GluonChunk(world: self, x: x, z: z)
        guard chunksLoaded.first(where: { $0.x == x && $0.z == z }) == nil else { return }
        let event:GluonChunkLoadEvent = GluonChunkLoadEvent(chunk: chunk)
        GluonServer.shared.callEvent(event: event)
        guard !event.isCancelled else { return }
        await chunk.load()
        chunksLoaded.append(chunk)
    }
    func unloadChunk(x: Int, z: Int) async {
        let chunk:any Chunk = GluonChunk(world: self, x: x, z: z)
        guard let index:Int = chunksLoaded.firstIndex(where: { $0.x == x && $0.z == z }) else { return }
        let event:GluonChunkUnloadEvent = GluonChunkUnloadEvent(chunk: chunk)
        GluonServer.shared.callEvent(event: event)
        guard !event.isCancelled else { return }
        chunksLoaded.remove(at: index)
        await chunk.unload()
    }
}
