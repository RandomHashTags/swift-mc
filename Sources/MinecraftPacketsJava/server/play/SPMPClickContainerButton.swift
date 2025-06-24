//
//  SPMPClickContainerButton.swift
//  
//
//  Created by Evan Anderson on 8/9/23.
//

import MinecraftPackets

public extension ServerPacket.Mojang.Java.Play {
    struct ClickContainerButton: ServerPacketMojangJavaPlayProtocol {
        public static let id:ServerPacket.Mojang.Java.Play = ServerPacket.Mojang.Java.Play.clickContainerButton
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let windowID:Int8 = try packet.readByte()
            let button_id:Int8 = try packet.readByte()
            return Self(windowID: windowID, button_id: button_id)
        }
        
        /// The ID of the window sent by [Open Screen](https://wiki.vg/Protocol#Open_Screen ).
        public let windowID:Int8
        /// Meaning depends on window type.
        public let button_id:Int8
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [windowID, button_id]
        }
    }
}
