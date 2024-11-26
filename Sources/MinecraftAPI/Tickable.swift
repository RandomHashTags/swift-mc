//
//  Tickable.swift
//  
//
//  Created by Evan Anderson on 2/16/23.
//

public protocol Tickable : ServerTickChangeListener {
    /// Logic executed every server tick.
    mutating func tick(_ server: any Server)
}
