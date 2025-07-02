
import MinecraftPackets

extension ServerPacket.Mojang.Java.Status {
    public struct PingRequest: ServerPacketMojangJavaStatusProtocol {
        public static let id = ServerPacket.Mojang.Java.Status.pingRequest

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let payload = try packet.readLong()
            return Self(payload: payload)
        }
        
        /// May be any number. Notchian clients use a system-dependent time value which is counted in milliseconds.
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
