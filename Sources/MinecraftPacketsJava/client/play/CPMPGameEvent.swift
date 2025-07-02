
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    public struct GameEvent: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.gameEvent

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let event:Event = try packet.readEnum()
            let value = try packet.readFloat()
            return Self(event: event, value: value)
        }
        
        public let event:Event
    
        /// Depends on Event.
        public let value:Float

        public init(
            event: Event,
            value: Float
        ) {
            self.event = event
            self.value = value
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [event, value]
        }
    }
}

// MARK: Event
extension ClientPacket.Mojang.Java.Play.GameEvent {
    public enum Event: Int, Codable, PacketEncodableMojangJava {
        /// > Note: Displays message 'block.minecraft.spawn.not\_valid' (You have no home bed or charged respawn anchor, or it was obstructed) to the player.
        case noRespawnBlockAvailable
        case beginRaining
        case endRaining
        /// !
        ///
        /// Value:
        /// - 0: Survival
        /// - 1: Creative
        /// - 2: Adventure
        /// - 3: Spectator
        case changeGameMode
        /// !
        ///
        /// Value:
        /// - 0: Just respawn player.
        /// - 1: Roll the credits and respawn player.
        ///
        /// > Note: 1 is only sent by notchian server when player has not yet achieved advancement "The end?", else 0 is sent.
        case winGame
        /// !
        ///
        /// Value:
        /// - 0: Show welcome to demo screen.
        /// - 101: Tell movement controls.
        /// - 102: Tell jump control.
        /// - 103: Tell inventory control.
        /// - 104: Tell that the demo is over and print a message about how to take a screenshot.
        case demoEvent
        /// > Note: Sent when any player is struck by an arrow.
        case arrowHitPlayer
        /// !
        ///
        /// Value: Rain level ranging from 0 to 1.
        /// > Note: Seems to change both sky color and lighting.
        case rainLevelChange
        /// !
        ///
        /// Value: Thunder level ranging from 0 to 1.
        /// > Note: Seems to change both sky color and lighting (same as Rain level change, but doesn't start rain). It also requires rain to render by notchian client.
        case thunderLevelChange
        case playPufferfishStingSound
        case playElderGuardianMobAppearance // effect and sound
        /// !
        ///
        /// Value:
        /// - 0: Enable respawn screen.
        /// - 1: Immediately respawn (sent when the doImmediateRespawn gamerule changes).
        case enableRespawnScreen
    }
}