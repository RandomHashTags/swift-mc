//
//  CPMPAwardStatistics.swift
//
//
//  Created by Evan Anderson on 8/2/23.
//

import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    /// Sent as a response to Client Command (id 1). Will only send the changed values if previously requested.
    struct AwardStatistics: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.awardStatistic
        
        /// Number of elements in `statistics`.
        public let count:VariableIntegerJava
        public let statistics:[AwardStatistics.Statistic]
        
        public struct Statistic: Codable, PacketEncodableMojangJava {
            public let category_id:VariableIntegerJava
            public let statistic_id:VariableIntegerJava
            public let value:VariableIntegerJava
            
            public func packetBytes() throws -> [UInt8] {
                var bytes:[UInt8] = try category_id.packetBytes()
                bytes.append(contentsOf: try statistic_id.packetBytes())
                bytes.append(contentsOf: try value.packetBytes())
                return bytes
            }
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[(any PacketEncodableMojangJava)?] = [count]
            array.append(contentsOf: statistics)
            return array
        }
    }
}
