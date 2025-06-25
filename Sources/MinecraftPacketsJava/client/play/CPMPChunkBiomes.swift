import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    public struct ChunkBiomes: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.chunkBiomes
        
        /// Number of elements in `data`.
        public let numberOfChunks:VariableIntegerJava
        public let data:[ChunkBiomes.BiomeData]

        public init(
            numberOfChunks: VariableIntegerJava,
            data: [BiomeData]
        ) {
            self.numberOfChunks = numberOfChunks
            self.data = data
        }
        
        public struct BiomeData: Codable, PacketEncodableMojangJava {
            /// Chunk coordinate (block coordinate divided by 16, rounded down)
            public let x:Int
            /// Chunk coordinate (block coordinate divided by 16, rounded down)
            public let z:Int
            /// Size of `data` in bytes
            public let size:VariableIntegerJava
            /// Chunk data structure, with sections containing only the `Biomes` field
            public let data:[UInt8]

            @inlinable
            public func packetBytes() throws -> [UInt8] {
                var array = try x.packetBytes()
                array.append(contentsOf: try z.packetBytes())
                array.append(contentsOf: try size.packetBytes())
                array.append(contentsOf: data)
                return array
            }
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[(any PacketEncodableMojangJava)?] = [numberOfChunks]
            array.append(contentsOf: data)
            return array
        }
    }
}
