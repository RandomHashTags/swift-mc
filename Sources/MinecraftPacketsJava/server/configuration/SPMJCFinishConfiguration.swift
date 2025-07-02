
import MinecraftPackets

extension ServerPacket.Mojang.Java.Configuration {
    /// Sent by the client to notify the client that the configuration process has finished. It is sent in response to the server's [Finish Configuration](https://wiki.vg/Protocol#Finish_Configuration ).
    struct FinishConfiguration: ServerPacketMojangJavaConfigurationProtocol {
        public static let id:ServerPacket.Mojang.Java.Configuration = ServerPacket.Mojang.Java.Configuration.finishConfiguration
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            return Self()
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return []
        }
    }
}
