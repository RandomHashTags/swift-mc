import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    struct DamageEvent: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.damageEvent
        
        /// The ID of the entity taking damage.
        public let entityID:VariableIntegerJava
        /// The ID of the type of damage taken.
        public let source_type_id:VariableIntegerJava
        /// The ID + 1 of the entity responsible for the damage, if present. If not present, the value is 0.
        public let source_cause_id:VariableIntegerJava
        /// The ID + 1 of the entity that directly dealt the damage, if present. If not present, the value is 0.
        ///
        /// If this field is present:
        /// - and damage was dealt indirectly, such as by the use of a projectile, this field will contain the ID of such projectile;
        /// - and damage was dealt dirctly, such as by manually attacking, this field will contain the same value as Source Cause ID
        public let source_direct_id:Int
        /// Indicates the presence of `source_position_x`, `source_position_y` and `source_position_z`.
        ///
        /// The Notchian server sends the Source Position when the damage was dealt by the /damage command and a position was specified
        public let has_source_position:Bool
        /// Only present if `has_source_position` is `true`.
        public let source_position_x:Double?
        /// Only present if `has_source_position` is `true`.
        public let source_position_y:Double?
        /// Only present if `has_source_position` is `true`.
        public let source_position_z:Double?
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [
                entityID,
                source_type_id,
                source_cause_id,
                source_direct_id,
                has_source_position,
                source_position_x,
                source_position_y,
                source_position_z
            ]
        }
    }
}
