//
//  CPMPSetBorderWarningDelay.swift
//  
//
//  Created by Evan Anderson on 8/8/23.
//

import Packets

extension ClientPacket.Mojang.Java.Play {
    struct SetBorderWarningDelay : ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.setBorderWarningDelay
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let warningTime:VariableIntegerJava = try packet.readVarInt()
            return Self(warningTime: warningTime)
        }
        
        /// In seconds as set by `/worldborder warning time`.
        public let warningTime:VariableIntegerJava
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [warningTime]
        }
    }
}
