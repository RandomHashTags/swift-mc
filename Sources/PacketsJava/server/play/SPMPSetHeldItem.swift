//
//  SPMPSetHeldItem.swift
//  
//
//  Created by Evan Anderson on 8/9/23.
//

import Packets

extension ServerPacket.Mojang.Java.Play {
    /// Sent when the player changes the slot selection.
    struct SetHeldItem : ServerPacketMojangJavaPlayProtocol {
        public static let id:ServerPacket.Mojang.Java.Play = ServerPacket.Mojang.Java.Play.setHeldItem
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let slot:Int16 = try packet.readShort()
            return Self(slot: slot)
        }
        
        /// The slot which the player has selected (0–8).
        public let slot:Int16
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [slot]
        }
    }
}
