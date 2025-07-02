
import MinecraftPackets

extension ServerPacket.Mojang.Java.Handshaking {
    /// This causes the server to switch into the target state.
    public struct Handshake: ServerPacketMojangJavaHandshakingProtocol {
        public static let id = ServerPacket.Mojang.Java.Handshaking.handshake

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let protocolVersion:MinecraftProtocolVersion.Java = try packet.readEnum()
            let serverAddress = try packet.readString()
            let serverPort = try packet.readUnsignedShort()
            let nextState:State = try packet.readEnum()
            return Handshake(protocolVersion: protocolVersion, serverAddress: serverAddress, serverPort: serverPort, nextState: nextState)
        }
        
        /// See https://wiki.vg/Protocol_version_numbers .
        public let protocolVersion:MinecraftProtocolVersion.Java

        /// Hostname or IP, e.g. localhost or 127.0.0.1, that was used to connect. The Notchian server does not use this information.
        /// > Note: SRV records are a simple redirect, e.g. if \_minecraft.\_tcp.example.com points to mc.example.org, users connecting to example.com will provide example.org as server address in addition to connecting to it.
        public let serverAddress:String

        /// Default is 25565. The Notchian server does not use this information.
        public let serverPort:UInt16

        public let nextState:State

        public init(
            protocolVersion: MinecraftProtocolVersion.Java,
            serverAddress: String,
            serverPort: UInt16,
            nextState: State
        ) {
            self.protocolVersion = protocolVersion
            self.serverAddress = serverAddress
            self.serverPort = serverPort
            self.nextState = nextState
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [protocolVersion, serverAddress, serverPort, nextState]
        }
        
        public enum State: Int, Codable, PacketEncodableMojangJava {
            case status = 1
            case login  = 2
        }
    }
}
