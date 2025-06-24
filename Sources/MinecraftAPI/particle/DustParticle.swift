//
//  DustParticle.swift
//  
//
//  Created by Evan Anderson on 11/28/24.
//

public protocol DustParticle: Particle {
    var color: Color { get }
    var size: Float { get }
}