
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// The latter 2 floats are used to indicate the flying speed and field of view respectively, while the first byte is used to determine the value of 4 booleans.
    public struct PlayerAbilities: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.playerAbilities

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let flags:Flags = try packet.readEnum()
            let flyingSpeed = try packet.readFloat()
            let fieldOfViewModifier = try packet.readFloat()
            return Self(flags: flags, flyingSpeed: flyingSpeed, fieldOfViewModifier: fieldOfViewModifier)
        }
        
        public let flags:Flags

        /// 0.05 by default.
        public let flyingSpeed:Float

        /// Modifies the field of view, like a speed potion. A Notchian server will use the same value as the movement speed sent in the [Update Attributes](https://wiki.vg/Protocol#Update_Attributes) packet, which defaults to 0.1 for players.
        public let fieldOfViewModifier:Float

        public init(
            flags: Flags,
            flyingSpeed: Float,
            fieldOfViewModifier: Float
        ) {
            self.flags = flags
            self.flyingSpeed = flyingSpeed
            self.fieldOfViewModifier = fieldOfViewModifier
        }
        
        public enum Flags: Int, Codable, PacketEncodableMojangJava {
            case invulnerable = 0x01
            case flying = 0x02
            case allowFlying = 0x04
            case creativeMode = 0x08
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [
                flags,
                flyingSpeed,
                fieldOfViewModifier
            ]
        }
    }
}
