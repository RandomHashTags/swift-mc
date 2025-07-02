
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    public struct DamageEvent: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.damageEvent
        
        /// The ID of the entity taking damage.
        public let entityID:VariableIntegerJava
        /// The ID of the type of damage taken.
        public let sourceTypeID:VariableIntegerJava
        /// The ID + 1 of the entity responsible for the damage, if present. If not present, the value is 0.
        public let sourceCauseID:VariableIntegerJava
        /// The ID + 1 of the entity that directly dealt the damage, if present. If not present, the value is 0.
        ///
        /// If this field is present:
        /// - and damage was dealt indirectly, such as by the use of a projectile, this field will contain the ID of such projectile;
        /// - and damage was dealt dirctly, such as by manually attacking, this field will contain the same value as Source Cause ID
        public let sourceDirectID:Int
        /// Indicates the presence of `source_position_x`, `source_position_y` and `source_position_z`.
        ///
        /// The Notchian server sends the Source Position when the damage was dealt by the /damage command and a position was specified
        public let hasSourcePosition:Bool
        /// Only present if `has_source_position` is `true`.
        public let sourcePositionX:Double?
        /// Only present if `has_source_position` is `true`.
        public let sourcePositionY:Double?
        /// Only present if `has_source_position` is `true`.
        public let sourcePositionZ:Double?

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [
                entityID,
                sourceTypeID,
                sourceCauseID,
                sourceDirectID,
                hasSourcePosition,
                sourcePositionX,
                sourcePositionY,
                sourcePositionZ
            ]
        }
    }
}
