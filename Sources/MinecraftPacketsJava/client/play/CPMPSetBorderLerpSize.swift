//
//  CPMPSetBorderLerpSize.swift
//  
//
//  Created by Evan Anderson on 8/8/23.
//

import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    struct SetBorderLerpSize : ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.setBorderLerpSize
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let old_diameter:Double = try packet.readDouble()
            let new_diameter:Double = try packet.readDouble()
            let speed:VariableLongJava = try packet.readVarLong()
            return Self(old_diameter: old_diameter, new_diameter: new_diameter, speed: speed)
        }
        
        /// Current length of a single side of the world border, in meters.
        public let old_diameter:Double
        /// Target length of a single side of the world border, in meters.
        public let new_diameter:Double
        /// Number of real-time _milliseconds_ until New Diameter is reached. It appears that Notchian server does not sync world border speed to game ticks, so it gets out of sync with server lag. If the world border is not moving, this is set to 0.
        public let speed:VariableLongJava
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [old_diameter, new_diameter, speed]
        }
    }
}
