//
//  CPMPSetSubtitleText.swift
//  
//
//  Created by Evan Anderson on 8/3/23.
//

import Packets

extension ClientPacket.Mojang.Java.Play {
    struct SetSubtitleText : ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.setSubtitleText
        
        public let text:ChatPacketMojang
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [text]
        }
    }
}
