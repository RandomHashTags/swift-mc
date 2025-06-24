import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    struct SetExperience: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.setExperience
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let experienceBar:Float = try packet.readFloat()
            let totalExperience:VariableIntegerJava = try packet.readVarInt()
            let level:VariableIntegerJava = try packet.readVarInt()
            return Self(experienceBar: experienceBar, totalExperience: totalExperience, level: level)
        }
        
        /// Between 0 and 1.
        public let experienceBar:Float
        /// See https://minecraft.fandom.com/wiki/Experience#Leveling_up for Total Experience to Level conversion.
        public let totalExperience:VariableIntegerJava
        public let level:VariableIntegerJava
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [experienceBar, totalExperience, level]
        }
    }
}
