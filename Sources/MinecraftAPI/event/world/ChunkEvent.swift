//
//  ChunkEvent.swift
//  
//
//  Created by Evan Anderson on 2/22/23.
//

public protocol ChunkEvent : Event {
    var chunk : any Chunk { get }
    
    init(chunk: any Chunk)
}
