
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    public struct ProgramCommandBlockMinecart: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.programCommandBlockMinecart
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let entityID:VariableIntegerJava = try packet.readVarInt()
            let command = try packet.readString()
            let trackOutput = try packet.readBool()
            return Self(entityID: entityID, command: command, trackOutput: trackOutput)
        }
        
        public let entityID:VariableIntegerJava
        public let command:String
        public let trackOutput:Bool
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [entityID, command, trackOutput]
        }
    }
}
