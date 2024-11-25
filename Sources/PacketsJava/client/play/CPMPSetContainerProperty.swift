//
//  CPMPSetContainerProperty.swift
//  
//
//  Created by Evan Anderson on 8/3/23.
//

/// This packet is used to inform the client that part of a GUI window should be updated.
import Packets

extension ClientPacket.Mojang.Java.Play {
    struct SetContainerProperty : ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.set_container_property
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let windowID:UInt8 = try packet.readUnsignedByte()
            let property:Int16 = try packet.readShort()
            let value:Int16 = try packet.readShort()
            return Self(windowID: windowID, property: property, value: value)
        }
        
        public let windowID:UInt8
        /// The property to be updated.
        public let property:Int16
        /// The new value for the property.
        public let value:Int16
        
        public func encoded_values() throws -> [(any PacketEncodableMojangJava)?] {
            return [windowID, property, value]
        }
    }
}
