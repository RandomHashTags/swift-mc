//
//  CPMPSystemChatMessage.swift
//  
//
//  Created by Evan Anderson on 8/3/23.
//

import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    /// Identifying the difference between Chat/System Message is important as it helps respect the user's chat visibility options. See processing chat for more info about these positions.
    struct SystemChatMessage : ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.systemChatMessage
        
        /// Limited to 262144 bytes.
        public let content:ChatPacketMojang
        /// Whether the message is an actionbar or chat message.
        public let overlay:Bool
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [content, overlay]
        }
    }
}
