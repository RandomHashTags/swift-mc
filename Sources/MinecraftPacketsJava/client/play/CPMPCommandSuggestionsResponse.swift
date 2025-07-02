import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// The server responds with a list of auto-completions of the last word sent to it. In the case of regular chat, this is a player username. Command names and parameters are also supported. The client sorts these alphabetically before listing them.
    public struct CommandSuggestionsResponse: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.commandSuggestionsResponse

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let id:VariableIntegerJava = try packet.readVarInt()
            let start:VariableIntegerJava = try packet.readVarInt()
            let length:VariableIntegerJava = try packet.readVarInt()
            let count:VariableIntegerJava = try packet.readVarInt()
            let matches:[CommandSuggestionsResponse.Match] = try packet.readMap(count: count.valueInt) { packet in
                let match = try packet.readString()
                let hasTooltip = try packet.readBool()
                let tooltip:ChatPacketMojang? = nil // TODO: fix
                return .init(match: match, hasTooltip: hasTooltip, tooltip: tooltip)
            }
            return Self(id: id, start: start, length: length, count: count, matches: matches)
        }
        
        /// Transaction ID.
        public let id:VariableIntegerJava
        /// Start of the text to replace.
        public let start:VariableIntegerJava
        /// Length of the text to replace.
        public let length:VariableIntegerJava
        /// Number of elements in `matches`.
        public let count:VariableIntegerJava
        public let matches:[CommandSuggestionsResponse.Match]

        @inlinable
        public init(
            id: VariableIntegerJava,
            start: VariableIntegerJava,
            length: VariableIntegerJava,
            count: VariableIntegerJava,
            matches: [CommandSuggestionsResponse.Match]
        ) {
            self.id = id
            self.start = start
            self.length = length
            self.count = count
            self.matches = matches
        }
        
        public struct Match: PacketEncodableMojangJava {
            /// One eligible value to insert, note that each command is sent separately instead of in a single string, hence the need for `count`.
            /// > Note: Doesn't include a leading `/` on commands.
            public let match:String
            public let hasTooltip:Bool
            /// Tooltip to display; only present if `hasTooltip` is true.
            public let tooltip:ChatPacketMojang?

            public init(
                match: String,
                hasTooltip: Bool,
                tooltip: ChatPacketMojang?
            ) {
                self.match = match
                self.hasTooltip = hasTooltip
                self.tooltip = tooltip
            }
            
            @inlinable
            public func packetBytes() throws -> [UInt8] {
                var array:[UInt8] = try match.packetBytes()
                array.append(contentsOf: try hasTooltip.packetBytes())
                if hasTooltip {
                    let tooltip = try unwrapOptional(tooltip, key: \Self.tooltip, precondition: "hasTooltip == true")
                    array.append(contentsOf: try tooltip.packetBytes())
                }
                return array
            }
        }
        
        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[(any PacketEncodableMojangJava)?] = [id, start, length, count]
            array.append(contentsOf: matches)
            return array
        }
    }
}
