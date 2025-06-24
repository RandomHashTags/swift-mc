import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    struct SetBorderSize: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.setBorderSize
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let diameter:Double = try packet.readDouble()
            return Self(diameter: diameter)
        }
        
        /// Length of a single side of the world border, in meters.
        public let diameter:Double
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [diameter]
        }
    }
}
