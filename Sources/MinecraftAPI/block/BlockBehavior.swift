//
//  BlockBehavior.swift
//
//
//  Created by Evan Anderson on 11/26/23.
//

public protocol BlockBehavior {
    var hasCollision : Bool { get }
    var explosionResistance : Float { get }
    var isRandomlyTicking : Bool { get }
    var soundType : any SoundType { get }
    var friction : Float { get }
    var speedFactor : Float { get }
    var jumpFactor : Float { get }
    var dynamicShape : Bool { get }
}
