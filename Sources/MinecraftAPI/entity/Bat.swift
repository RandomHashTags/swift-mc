//
//  Bat.swift
//  
//
//  Created by Evan Anderson on 11/27/24.
//

public protocol Bat: Ambient, Flyable {
    var isAwake: Bool { get }
}