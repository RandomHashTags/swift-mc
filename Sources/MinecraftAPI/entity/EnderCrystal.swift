//
//  EnderCrystal.swift
//  
//
//  Created by Evan Anderson on 11/27/24.
//

public protocol EnderCrystal: Entity {
    var beamTarget: (any Location)? { get }
    var isShowingBottom: Bool { get }
}