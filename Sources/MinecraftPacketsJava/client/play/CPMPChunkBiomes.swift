import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    struct ChunkBiomes: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.chunkBiomes
        
        /// Number of elements in `data`.
        public let number_of_chunks:VariableIntegerJava
        public let data:[ChunkBiomes.BiomeData]
        
        public struct BiomeData: Codable, PacketEncodableMojangJava {
            /// Chunk coordinate (block coordinate divided by 16, rounded down)
            public let x:Int
            /// Chunk coordinate (block coordinate divided by 16, rounded down)
            public let z:Int
            /// Size of `data` in bytes
            public let size:VariableIntegerJava
            /// Chunk data structure, with sections containing only the `Biomes` field
            public let data:[UInt8]
            
            public func packetBytes() throws -> [UInt8] {
                var array:[UInt8] = try x.packetBytes()
                array.append(contentsOf: try z.packetBytes())
                array.append(contentsOf: try size.packetBytes())
                array.append(contentsOf: data)
                return array
            }
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[(any PacketEncodableMojangJava)?] = [number_of_chunks]
            array.append(contentsOf: data)
            return array
        }
    }
}
