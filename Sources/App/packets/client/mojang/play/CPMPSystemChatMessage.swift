//
//  CPMPSystemChatMessage.swift
//  
//
//  Created by Evan Anderson on 8/3/23.
//

import Foundation

public extension ClientPacketMojang.Play {
    /// Identifying the difference between Chat/System Message is important as it helps respect the user's chat visibility options. See processing chat for more info about these positions.
    struct SystemChatMessage : ClientPacketMojangPlayProtocol {
        public static let id:ClientPacketMojangPlay = ClientPacketMojangPlay.system_chat_message
        
        /// Limited to 262144 bytes.
        public let content:ChatPacketMojang
        /// Whether the message is an actionbar or chat message.
        public let overlay:Bool
        
        public func encoded_values() throws -> [(any PacketEncodableMojang)?] {
            return [content, overlay]
        }
    }
}
