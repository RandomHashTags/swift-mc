import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    /// Sent by the server to set the health of the player it is sent to.
    ///
    /// Food saturation acts as a food “overcharge”. Food values will not decrease while the saturation is over zero. New players logging in or respawning automatically get a saturation of 5.0. Eating food increases the saturation as well as the food bar.
    struct SetHealth: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.setHealth
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let health:Float = try packet.readFloat()
            let food:VariableIntegerJava = try packet.readVarInt()
            let food_saturation:Float = try packet.readFloat()
            return Self(health: health, food: food, food_saturation: food_saturation)
        }
        /// 0 or less = dead, 20 = full HP.
        public let health:Float
        /// 0–20.
        public let food:VariableIntegerJava
        /// Seems to vary from 0.0 to 5.0 in integer increments.
        public let food_saturation:Float
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [health, food, food_saturation]
        }
    }
}
