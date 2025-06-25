
import MinecraftPackets

extension ClientPacket.Mojang.Java.Status {
    public struct PingResponse: ClientPacketMojangJavaStatusProtocol {
        public static let id = ClientPacket.Mojang.Java.Status.pingResponse

        /// Should be the same as sent by the client.
        public let payload:Int64

        public init(
            payload: Int64
        ) {
            self.payload = payload
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [payload]
        }
    }
}

// MARK: Parse
extension ClientPacket.Mojang.Java.Status.PingResponse {
    @inlinable
    public static func parse(_ packet: any GeneralPacket) throws -> Self {
        let payload = try packet.readLong()
        return Self(payload: payload)
    }
}