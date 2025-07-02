import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    struct SetBorderWarningDistance: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.setBorderWarningDistance
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let warningBlocks:VariableIntegerJava = try packet.readVarInt()
            return Self(warningBlocks: warningBlocks)
        }
        
        /// In meters.
        public let warningBlocks:VariableIntegerJava
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [warningBlocks]
        }
    }
}
