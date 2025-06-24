//
//  CPMPSetHeldItem.swift
//  
//
//  Created by Evan Anderson on 8/9/23.
//

import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    /// Sent to change the player's slot selection.
    struct SetHeldItem: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.setHeldItem
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let slot:Int8 = try packet.readByte()
            return Self(slot: slot)
        }
        
        /// The slot which the player has selected (0–8).
        public let slot:Int8
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [slot]
        }
    }
}
