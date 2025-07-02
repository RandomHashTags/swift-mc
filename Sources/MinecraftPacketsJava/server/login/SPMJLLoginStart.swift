
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

import MinecraftPackets

extension ServerPacket.Mojang.Java.Login {
    public struct LoginStart: ServerPacketMojangJavaLoginProtocol {
        public static let id = ServerPacket.Mojang.Java.Login.loginStart

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let name = try packet.readString()
            let playerUUID = try packet.readUUID()
            return Self(name: name, playerUUID: playerUUID)
        }
        
        /// Player's Username.
        public let name:String

        /// The UUID of the player logging in. Unused by the Notchian server.
        public let playerUUID:UUID

        public init(
            name: String,
            playerUUID: UUID
        ) {
            self.name = name
            self.playerUUID = playerUUID
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [name, playerUUID]
        }
    }
}
