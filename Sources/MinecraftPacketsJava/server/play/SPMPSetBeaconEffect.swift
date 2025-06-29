import MinecraftPackets

public extension ServerPacket.Mojang.Java.Play {
    /// Changes the effect of the current beacon.
    struct SetBeaconEffect: ServerPacketMojangJavaPlayProtocol {
        public static let id:ServerPacket.Mojang.Java.Play = ServerPacket.Mojang.Java.Play.setBeaconEffect
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let has_primary_effect:Bool = try packet.readBool()
            let primary_effect:VariableIntegerJava = try packet.readVarInt()
            let has_secondary_effect:Bool = try packet.readBool()
            let secondary_effect:VariableIntegerJava = try packet.readVarInt()
            return Self(has_primary_effect: has_primary_effect, primary_effect: primary_effect, has_secondary_effect: has_secondary_effect, secondary_effect: secondary_effect)
        }
        
        public let has_primary_effect:Bool
        /// A [Potion ID](https://minecraft.gamepedia.com/Data_values#Potions ). (Was a full Integer for the plugin message).
        public let primary_effect:VariableIntegerJava
        public let has_secondary_effect:Bool
        /// A [Potion ID](https://minecraft.gamepedia.com/Data_values#Potions ). (Was a full Integer for the plugin message).
        public let secondary_effect:VariableIntegerJava
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [has_primary_effect, primary_effect, has_secondary_effect, secondary_effect]
        }
    }
}
