
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// Changes the effect of the current beacon.
    public struct SetBeaconEffect: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.setBeaconEffect

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let hasPrimaryEffect = try packet.readBool()
            let primaryEffect:VariableIntegerJava = try packet.readVarInt()
            let hasSecondaryEffect = try packet.readBool()
            let secondaryEffect:VariableIntegerJava = try packet.readVarInt()
            return Self(hasPrimaryEffect: hasPrimaryEffect, primaryEffect: primaryEffect, hasSecondaryEffect: hasSecondaryEffect, secondaryEffect: secondaryEffect)
        }
        
        public let hasPrimaryEffect:Bool

        /// A [Potion ID](https://minecraft.gamepedia.com/Data_values#Potions ). (Was a full Integer for the plugin message).
        public let primaryEffect:VariableIntegerJava

        public let hasSecondaryEffect:Bool

        /// A [Potion ID](https://minecraft.gamepedia.com/Data_values#Potions ). (Was a full Integer for the plugin message).
        public let secondaryEffect:VariableIntegerJava

        public init(
            hasPrimaryEffect: Bool,
            primaryEffect: VariableIntegerJava,
            hasSecondaryEffect: Bool,
            secondaryEffect: VariableIntegerJava
        ) {
            self.hasPrimaryEffect = hasPrimaryEffect
            self.primaryEffect = primaryEffect
            self.hasSecondaryEffect = hasSecondaryEffect
            self.secondaryEffect = secondaryEffect
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [hasPrimaryEffect, primaryEffect, hasSecondaryEffect, secondaryEffect]
        }
    }
}
