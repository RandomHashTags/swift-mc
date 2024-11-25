//
//  CPMPPlayerAbilities.swift
//  
//
//  Created by Evan Anderson on 8/8/23.
//

import Packets

extension ClientPacket.Mojang.Java.Play {
    /// The latter 2 floats are used to indicate the flying speed and field of view respectively, while the first byte is used to determine the value of 4 booleans.
    struct PlayerAbilities : ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.player_abilities
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let flags:Flags = try packet.readEnum()
            let flying_speed:Float = try packet.readFloat()
            let field_of_view_modifier:Float = try packet.readFloat()
            return Self(flags: flags, flying_speed: flying_speed, field_of_view_modifier: field_of_view_modifier)
        }
        
        public let flags:Flags
        /// 0.05 by default.
        public let flying_speed:Float
        /// Modifies the field of view, like a speed potion. A Notchian server will use the same value as the movement speed sent in the [Update Attributes](https://wiki.vg/Protocol#Update_Attributes) packet, which defaults to 0.1 for players.
        public let field_of_view_modifier:Float
        
        public enum Flags : Int, Codable, PacketEncodableMojangJava {
            case invulnerable = 0x01
            case flying = 0x02
            case allow_flying = 0x04
            case creative_mode = 0x08
        }
        
        public func encoded_values() throws -> [(any PacketEncodableMojangJava)?] {
            return [
                flags,
                flying_speed,
                field_of_view_modifier
            ]
        }
    }
}
