//
//  CPMPTagQueryResponse.swift
//  
//
//  Created by Evan Anderson on 8/3/23.
//

import Foundation
import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    /// Sent in response to Query Block Entity Tag or Query Entity Tag.
    struct TagQueryResponse: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.tagQueryResponse
        
        /// Can be compared to the one sent in the original query packet.
        public let transactionID:VariableIntegerJava
        /// The NBT of the block or entity. May be a TAG_END (0) in which case no NBT is present.
        public let nbt:Data // TODO: support NBT Tags
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [transactionID, nbt]
        }
    }
}
