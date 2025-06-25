import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// Lists all of the commands on the server, and how they are parsed.
    ///
    /// This is a directed graph, with one root node. Each redirect or child node must refer only to nodes that have already been declared.
    public struct Commands: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.commands

        @inlinable
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let count:VariableIntegerJava = try packet.readVarInt()
            let nodes:[CommandNodeMojang] = try packet.readMap(count: count.valueInt) {
                return try packet.readPacket()
            }
            let rootIndex:VariableIntegerJava = try packet.readVarInt()
            return Self(count: count, nodes: nodes, rootIndex: rootIndex)
        }
        
        /// Number of elements in `nodes`.
        public let count:VariableIntegerJava
        public let nodes:[CommandNodeMojang]
        /// Index of the `root` node in `nodes`.
        public let rootIndex:VariableIntegerJava

        public init(
            count: VariableIntegerJava,
            nodes: [CommandNodeMojang],
            rootIndex: VariableIntegerJava
        ) {
            self.count = count
            self.nodes = nodes
            self.rootIndex = rootIndex
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[(any PacketEncodableMojangJava)?] = [count]
            array.append(contentsOf: nodes)
            array.append(rootIndex)
            return array
        }
    }
}
