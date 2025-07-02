import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    public struct SetBorderCenter: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.setBorderCenter

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let x = try packet.readDouble()
            let z = try packet.readDouble()
            return Self(x: x, z: z)
        }
        
        public let x:Double
        public let z:Double

        public init(
            x: Double,
            z: Double
        ) {
            self.x = x
            self.z = z
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [x, z]
        }
    }
}
