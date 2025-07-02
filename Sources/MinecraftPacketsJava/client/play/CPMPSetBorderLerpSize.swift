
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    public struct SetBorderLerpSize: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.setBorderLerpSize

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let oldDiameter = try packet.readDouble()
            let newDiameter = try packet.readDouble()
            let speed:VariableLongJava = try packet.readVarLong()
            return Self(oldDiameter: oldDiameter, newDiameter: newDiameter, speed: speed)
        }
        
        /// Current length of a single side of the world border, in meters.
        public let oldDiameter:Double

        /// Target length of a single side of the world border, in meters.
        public let newDiameter:Double

        /// Number of real-time _milliseconds_ until New Diameter is reached. It appears that Notchian server does not sync world border speed to game ticks, so it gets out of sync with server lag. If the world border is not moving, this is set to 0.
        public let speed:VariableLongJava

        public init(
            oldDiameter: Double,
            newDiameter: Double,
            speed: VariableLongJava
        ) {
            self.oldDiameter = oldDiameter
            self.newDiameter = newDiameter
            self.speed = speed
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [oldDiameter, newDiameter, speed]
        }
    }
}
