//
//  CPMPClearTitles.swift
//  
//
//  Created by Evan Anderson on 8/3/23.
//

import Packets

extension ClientPacket.Mojang.Java.Play {
    /// Clear the client's current title information, with the option to also reset it.
    struct ClearTitles : ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.clearTitles
        
        public let reset:Bool
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [reset]
        }
    }
}
