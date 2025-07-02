
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// Sent when Generate is pressed on the [Jigsaw Block](https://minecraft.fandom.com/wiki/Jigsaw_Block) interface.
    public struct JigsawGenerate: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.jigsawGenerate
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let location:PositionPacketMojang = try packet.readPacket()
            let levels:VariableIntegerJava = try packet.readVarInt()
            let keepJigsaws = try packet.readBool()
            return Self(location: location, levels: levels, keepJigsaws: keepJigsaws)
        }
        
        /// Block entity location.
        public let location:PositionPacketMojang
        /// Value of the levels slider/max depth to generate.
        public let levels:VariableIntegerJava
        public let keepJigsaws:Bool
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [location, levels, keepJigsaws]
        }
    }
}
