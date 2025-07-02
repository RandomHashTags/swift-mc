#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif
import MinecraftPackets

public struct CommandNodeMojang: Codable, PacketEncodableMojangJava, PacketDecodableMojangJava {
    public let flags:Int8
    public let childrenCount:VariableIntegerJava
    public let children:[VariableIntegerJava]
    public let redirectNode:VariableIntegerJava?
    public let name:String?
    public let parser:Parser?
    public let properties:Data?
    public let suggestionsType:NamespaceJava?

    @inlinable
    public init(
        flags: Int8,
        childrenCount: VariableIntegerJava,
        children: [VariableIntegerJava],
        redirectNode: VariableIntegerJava?,
        name: String?,
        parser: Parser?,
        properties: Data?,
        suggestionsType: NamespaceJava?
    ) {
        self.flags = flags
        self.childrenCount = childrenCount
        self.children = children
        self.redirectNode = redirectNode
        self.name = name
        self.parser = parser
        self.properties = properties
        self.suggestionsType = suggestionsType
    }

    @inlinable
    public func packetBytes() throws -> [UInt8] {
        var array = try flags.packetBytes()
        array.append(contentsOf: try childrenCount.packetBytes())
        for child in children {
            array.append(contentsOf: try child.packetBytes())
        }
        if (flags & 0x08) != 0 {
            let redirectNode = try unwrapOptional(redirectNode, key: \Self.redirectNode, precondition: "(flags & 0x08) != 0")
            array.append(contentsOf: try redirectNode.packetBytes())
        }
        return array
    }
}

// MARK: Decode
extension CommandNodeMojang {
    @inlinable
    public static func decode<T: GeneralPacket>(from packet: inout T) throws -> Self {
        let flags = try packet.readByte()
        let childrenCount:VariableIntegerJava = try packet.readVarInt()
        let children:[VariableIntegerJava] = try packet.readMap(count: childrenCount.valueInt) {
            return try $0.readVarInt()
        }
        let redirectNode:VariableIntegerJava?
        if (flags & 0x08) != 0 {
            redirectNode = try packet.readVarInt()
        } else {
            redirectNode = nil
        }
        
        let flagNodeType = flags & 0x03
        
        let name:String?
        let parser:CommandNodeMojang.Parser?
        let properties:Data?
        switch flagNodeType {
        case 1:
            name = try packet.readString()
            parser = nil
            properties = nil
        case 2:
            name = try packet.readString()
            parser = try packet.readEnum()
            properties = nil // TODO: fix
        default:
            name = nil
            parser = nil
            properties = nil
        }
        
        let suggestionsType:NamespaceJava?
        if (flags & 0x10) != 0 {
            suggestionsType = try packet.readIdentifier()
        } else {
            suggestionsType = nil
        }
        return Self(
            flags: flags,
            childrenCount: childrenCount,
            children: children,
            redirectNode: redirectNode,
            name: name,
            parser: parser,
            properties: properties,
            suggestionsType: suggestionsType
        )
    }
}

// MARK: Parser
extension CommandNodeMojang {
    public enum Parser: Int, Codable, PacketEncodableMojangJava {
        case brigadier_bool = 0
        case brigadier_float = 1
        case brigadier_double
        case brigadier_integer
        case brigadier_long
        case brigadier_string
        case minecraft_entity
        case minecraft_game_profile
        case minecraft_block_pos
        case minecraft_column_pos
        case minecraft_vec3
        case minecraft_vec2
        case minecraft_block_state
        case minecraft_block_predicate
        case minecraft_item_stack
        case minecraft_item_predicate
        case minecraft_color
        case minecraft_component
        case minecraft_message
        case minecraft_nbt
        case minecraft_nbt_tag
        case minecraft_nbt_path
        case minecraft_objective
        case minecraft_objective_criteria
        case minecraft_operation
        case minecraft_particle
        case minecraft_angle
        case minecraft_rotation
        case minecraft_scoreboard_slot
        case minecraft_score_holder
        case minecraft_swizzle
        case minecraft_team
        case minecraft_item_slot
        case minecraft_resource_location
        case minecraft_function
        case minecraft_entity_anchor
        case minecraft_int_range
        case minecraft_float_range
        case minecraft_dimension
        case minecraft_gamemode
        case minecraft_time
        case minecraft_resource_or_tag
        case minecraft_resource_or_tag_key
        case minecraft_resource
        case minecraft_resource_key
        case minecraft_template_mirror
        case minecraft_template_rotation
        case minecraft_heightmap
        case minecraft_uuid
    }
}

// MARK: Properties
extension CommandNodeMojang {
    public enum Properties {
        public enum Brigadier {
            public struct Double: CommandNodeMojangProperty {
                public let flags:UInt8
                public let min:Swift.Double?
                public let max:Swift.Double?

                @inlinable
                public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
                    var array:[(any PacketEncodableMojangJava)?] = [flags]
                    if (flags & 0x01) != 0 {
                        array.append(min)
                    }
                    if (flags & 0x02) != 0 {
                        array.append(max)
                    }
                    return array
                }
            }
        }
    }
}

// MARK: CommandNodeMojangProperty
public protocol CommandNodeMojangProperty: Codable, PacketEncodableMojangJava {
    func encodedValues() throws -> [(any PacketEncodableMojangJava)?]
}
extension CommandNodeMojangProperty {
    @inlinable
    public func packetBytes() throws -> [UInt8] {
        return try encodedValues().compactMap({ try $0?.packetBytes() }).flatMap({ $0 })
    }
}
