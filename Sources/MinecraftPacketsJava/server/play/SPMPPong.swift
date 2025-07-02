
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// Response to the clientbound packet ([Ping](https://wiki.vg/Protocol#Ping_.28play.29 )) with the same id.
    public struct Pong: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.pong

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let id = try packet.readInt()
            return Self(id: id)
        }
        
        /// `id` is the same as the ping packet.
        public let id:Int32

        public init(
            id: Int32
        ) {
            self.id = id
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [id]
        }
    }
}
