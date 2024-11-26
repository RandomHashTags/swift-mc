//
//  CPMPChangeDifficulty.swift
//  
//
//  Created by Evan Anderson on 8/2/23.
//

import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    /// Changes the difficulty setting in the client's option menu.
    struct ChangeDifficulty : ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.changeDifficulty
        
        public let difficulty:ChangeDifficulty.Difficulty
        public let difficulty_locked:Bool
        
        public enum Difficulty : UInt8, Codable, PacketEncodableMojangJava {
            case peaceful = 0
            case easy
            case normal
            case hard
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [difficulty, difficulty_locked]
        }
    }
}
