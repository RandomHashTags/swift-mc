
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    public struct SetBorderSize: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.setBorderSize

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let diameter = try packet.readDouble()
            return Self(diameter: diameter)
        }
        
        /// Length of a single side of the world border, in meters.
        public let diameter:Double

        public init(
            diameter: Double
        ) {
            self.diameter = diameter
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [diameter]
        }
    }
}
