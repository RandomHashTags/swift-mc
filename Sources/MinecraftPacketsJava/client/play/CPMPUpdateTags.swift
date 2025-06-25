
import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    struct UpdateTags: ClientPacket.Mojang.Java.PlayProtocol { // TODO: fix
        public static let id = ClientPacket.Mojang.Java.Play.updateTags
        
        /// Number of elements in `tags`.
        public let count:VariableIntegerJava
        public let tagTypes:[NamespaceJava]
        public let tags:[UpdateTags.Tag]
        
        public struct Tag: Codable, PacketEncodableMojangJava {
            public let length:VariableIntegerJava
            public let entries:[UpdateTags.Tag.Entry]
            
            public struct Entry: Codable, PacketEncodableMojangJava {
                public let tagName:NamespaceJava
                public let count:VariableIntegerJava
                /// Numeric ID of the given type (block, item, etc.).
                public let entries:[VariableIntegerJava]
                
                public func packetBytes() throws -> [UInt8] {
                    var array:[UInt8] = try tagName.packetBytes()
                    array.append(contentsOf: try count.packetBytes())
                    for entry in entries {
                        array.append(contentsOf: try entry.packetBytes())
                    }
                    return array
                }
            }
            
            public func packetBytes() throws -> [UInt8] {
                var array:[UInt8] = try length.packetBytes()
                for entry in entries {
                    array.append(contentsOf: try entry.packetBytes())
                }
                return array
            }
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[(any PacketEncodableMojangJava)?] = [count]
            array.append(contentsOf: tagTypes)
            array.append(contentsOf: tags)
            return array
        }
    }
}
