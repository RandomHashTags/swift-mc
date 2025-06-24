//
//  CPMPCommands.swift
//  
//
//  Created by Evan Anderson on 8/3/23.
//

import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    /// Lists all of the commands on the server, and how they are parsed.
    ///
    /// This is a directed graph, with one root node. Each redirect or child node must refer only to nodes that have already been declared.
    struct Commands: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.commands
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let count:VariableIntegerJava = try packet.readVarInt()
            let nodes:[CommandNodeMojang] = try packet.readMap(count: count.value_int) {
                return try packet.readPacket()
            }
            let root_index:VariableIntegerJava = try packet.readVarInt()
            return Self(count: count, nodes: nodes, root_index: root_index)
        }
        
        /// Number of elements in `nodes`.
        public let count:VariableIntegerJava
        public let nodes:[CommandNodeMojang]
        /// Index of the `root` node in `nodes`.
        public let root_index:VariableIntegerJava
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[(any PacketEncodableMojangJava)?] = [count]
            array.append(contentsOf: nodes)
            array.append(root_index)
            return array
        }
    }
}
