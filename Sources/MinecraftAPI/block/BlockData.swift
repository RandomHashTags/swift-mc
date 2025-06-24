//
//  BlockData.swift
//  
//
//  Created by Evan Anderson on 11/26/24.
//

public protocol BlockData: BlockMovable {
    var material: any Material { get }
    var placementMaterial: any Material { get }

    var hasCollision: Bool { get }

    var explosionResistance: Float { get }

    var isRandomlyTicking: Bool { get }

    var soundGroup: any SoundGroup { get }

    var friction: Float { get }

    var speedFactor: Float { get }

    var jumpFactor: Float { get }

    var dynamicShape: Bool { get }

    var lightLevel: Int { get }

    var isOccluding: Bool { get }

    var mapColor: Color { get }

    var requiresCorrectToolForDrops: Bool { get }
}