
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// Teleports the player to the given entity. The player must be in spectator mode.
    ///
    /// The Notchian client only uses this to teleport to players, but it appears to accept any type of entity. The entity does not need to be in the same dimension as the player; if necessary, the player will be respawned in the right world. If the given entity cannot be found (or isn't loaded), this packet will be ignored. It will also be ignored if the player attempts to teleport to themselves.
    public struct TeleportToEntity: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.teleportToEntity

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let targetPlayer = try packet.readUUID()
            return Self(targetPlayer: targetPlayer)
        }
        
        /// UUID of the player to teleport to (can also be an entity UUID).
        public let targetPlayer:UUID

        public init(
            targetPlayer: UUID
        ) {
            self.targetPlayer = targetPlayer
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [targetPlayer]
        }
    }
}
