
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    public struct SetDefaultSpawnPosition: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.setDefaultSpawnPosition
        
        /// Sent by the server after login to specify the coordinates of the spawn point (the point at which players spawn at, and which the compass points to). It can be sent at any time to update the point compasses point at.
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let location:PositionPacketMojang = try packet.readPacket()
            let angle = try packet.readFloat()
            return Self(location: location, angle: angle)
        }
        
        /// Spawn location.
        public let location:PositionPacketMojang
        /// The angle at which to respawn at.
        public let angle:Float

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [location, angle]
        }
    }
}
