
import MinecraftPackets

extension ClientPacket.Mojang.Java.Status {
    struct PingResponse: ClientPacketMojangJavaStatusProtocol {
        public static let id = ClientPacket.Mojang.Java.Status.pingResponse
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let payload:Int64 = try packet.readLong()
            return Self(payload: payload)
        }
        
        /// Should be the same as sent by the client.
        public let payload:Int64
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [payload]
        }
    }
}
