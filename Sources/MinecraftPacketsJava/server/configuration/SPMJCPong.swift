
import MinecraftPackets

extension ServerPacket.Mojang.Java.Configuration {
    /// Response to the clientbound packet ([Ping](https://wiki.vg/Protocol#Ping_.28configuration.29 )) with the same id.
    struct Pong: ServerPacketMojangJavaConfigurationProtocol {
        public static let id:ServerPacket.Mojang.Java.Configuration = ServerPacket.Mojang.Java.Configuration.pong
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let id:Int32 = try packet.readInt()
            return Self(id: id)
        }
        
        /// `id` is the same as the ping packet.
        public let id:Int32
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [id]
        }
    }
}
