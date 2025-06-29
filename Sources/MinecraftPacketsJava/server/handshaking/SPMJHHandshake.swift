
import MinecraftPackets

extension ServerPacket.Mojang.Java.Handshaking {
    /// This causes the server to switch into the target state.
    struct Handshake: ServerPacketMojangJavaHandshakingProtocol {
        public static let id:ServerPacket.Mojang.Java.Handshaking = ServerPacket.Mojang.Java.Handshaking.handshake
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let protocolVersion:MinecraftProtocolVersion.Java = try packet.readEnum()
            let server_address:String = try packet.readString()
            let server_port:UInt16 = try packet.readUnsignedShort()
            let next_state:State = try packet.readEnum()
            return Handshake(protocolVersion: protocolVersion, server_address: server_address, server_port: server_port, next_state: next_state)
        }
        
        /// See https://wiki.vg/Protocol_version_numbers .
        public let protocolVersion:MinecraftProtocolVersion.Java
        /// Hostname or IP, e.g. localhost or 127.0.0.1, that was used to connect. The Notchian server does not use this information.
        /// > Note: SRV records are a simple redirect, e.g. if \_minecraft.\_tcp.example.com points to mc.example.org, users connecting to example.com will provide example.org as server address in addition to connecting to it.
        public let server_address:String
        /// Default is 25565. The Notchian server does not use this information.
        public let server_port:UInt16
        public let next_state:State
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [protocolVersion, server_address, server_port, next_state]
        }
        
        public enum State: Int, Codable, PacketEncodableMojangJava {
            case status = 1
            case login  = 2
        }
    }
}
