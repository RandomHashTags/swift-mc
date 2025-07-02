
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// Sent as a response to Client Command (id 1). Will only send the changed values if previously requested.
    public struct AwardStatistics: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.awardStatistic
        
        /// Number of elements in `statistics`.
        public let count:VariableIntegerJava
        public let statistics:[AwardStatistics.Statistic]
        
        public struct Statistic: Codable, PacketEncodableMojangJava {
            public let categoryID:VariableIntegerJava
            public let statisticID:VariableIntegerJava
            public let value:VariableIntegerJava

            @inlinable
            public func packetBytes() throws -> [UInt8] {
                var bytes = try categoryID.packetBytes()
                bytes.append(contentsOf: try statisticID.packetBytes())
                bytes.append(contentsOf: try value.packetBytes())
                return bytes
            }
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[(any PacketEncodableMojangJava)?] = [count]
            array.append(contentsOf: statistics)
            return array
        }
    }
}
