//
//  SPMPUpdateSign.swift
//  
//
//  Created by Evan Anderson on 8/9/23.
//

import MinecraftPackets

public extension ServerPacket.Mojang.Java.Play {
    /// This message is sent from the client to the server when the “Done” button is pushed after placing a sign.
    ///
    /// The server only accepts this packet after [Open Sign Editor](https://wiki.vg/Protocol#Open_Sign_Editor ), otherwise this packet is silently ignored.
    struct UpdateSign: ServerPacketMojangJavaPlayProtocol {
        public static let id:ServerPacket.Mojang.Java.Play = ServerPacket.Mojang.Java.Play.updateSign
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let location:PositionPacketMojang = try packet.readPacket()
            let is_front_text:Bool = try packet.readBool()
            let line_1:String = try packet.readString()
            let line_2:String = try packet.readString()
            let line_3:String = try packet.readString()
            let line_4:String = try packet.readString()
            return Self(location: location, is_front_text: is_front_text, line_1: line_1, line_2: line_2, line_3: line_3, line_4: line_4)
        }
        
        /// Block Coordinates.
        public let location:PositionPacketMojang
        /// Whether the updated text is in front or on the back of the sign.
        public let is_front_text:Bool
        public let line_1:String
        public let line_2:String
        public let line_3:String
        public let line_4:String
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [
                location,
                is_front_text,
                line_1,
                line_2,
                line_3,
                line_4
            ]
        }
    }
}
