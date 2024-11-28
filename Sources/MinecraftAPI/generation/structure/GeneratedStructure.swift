//
//  GeneratedStructure.swift
//  
//
//  Created by Evan Anderson on 11/28/24.
//

public protocol GeneratedStructure {
    var boundary : any Boundary { get }
    var structure : any Structure { get }
    var pieces : [any GeneratedStructurePiece] { get } // TODO: make Set
}