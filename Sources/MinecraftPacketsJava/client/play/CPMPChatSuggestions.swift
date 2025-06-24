//
//  CPMPChatSuggestions.swift
//  
//
//  Created by Evan Anderson on 8/3/23.
//

import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    /// Unused by the Notchian server. Likely provided for custom servers to send chat message completions to clients.
    struct ChatSuggestions: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.chatSuggestions
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let action:ChatSuggestions.Action = try packet.readEnum()
            let count:VariableIntegerJava = try packet.readVarInt()
            let entries:[String] = try packet.readStringArray(count: count.value_int)
            return Self(action: action, count: count, entries: entries)
        }
        
        public let action:ChatSuggestions.Action
        /// Number of elements in `entries`.
        public let count:VariableIntegerJava
        public let entries:[String]
        
        public enum Action: Int, Codable, PacketEncodableMojangJava {
            case add = 0
            case remote
            case set
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[(any PacketEncodableMojangJava)?] = [action, count]
            array.append(contentsOf: entries)
            return array
        }
    }
}
