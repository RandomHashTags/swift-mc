//
//  SoundEvent.swift
//
//
//  Created by Evan Anderson on 11/26/23.
//

public protocol SoundEvent {
    static var defaultRange: Float { get }
    
    var range: Float { get }
}
