//
//  CPMPEntityAnimation.swift
//
//
//  Created by Evan Anderson on 8/2/23.
//

import Packets

extension ClientPacket.Mojang.Java.Play {
    /// Sent whenever an entity should change animation.
    struct EntityAnimation : ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.entityAnimation
        
        public let entityID:VariableIntegerJava
        public let animationID:Int
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [entityID, animationID]
        }
    }
}
