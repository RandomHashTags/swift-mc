//
//  SPMPSwingArm.swift
//  
//
//  Created by Evan Anderson on 8/9/23.
//

import Packets

extension ServerPacket.Mojang.Java.Play {
    /// Sent when the player's arm swings.
    struct SwingArm : ServerPacketMojangJavaPlayProtocol {
        public static let id:ServerPacket.Mojang.Java.Play = ServerPacket.Mojang.Java.Play.swing_arm
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let hand:SwingArm.Hand = try packet.readEnum()
            return Self(hand: hand)
        }
        
        public let hand:SwingArm.Hand
        
        public enum Hand : Int, Codable, PacketEncodableMojangJava {
            case main_hand
            case off_hand
        }
        
        public func encoded_values() throws -> [(any PacketEncodableMojangJava)?] {
            return [hand]
        }
    }
}
