
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// !
    ///
    /// The Notchian client determines how solid to display the warning by comparing to whichever is higher, the warning distance or whichever is lower, the distance from the current diameter to the target diameter or the place the border will be after warningTime seconds.
    public struct InitializeWorldBorder: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.initializeWorldBorder
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let x = try packet.readDouble()
            let z = try packet.readDouble()
            let oldDiameter = try packet.readDouble()
            let newDiameter = try packet.readDouble()
            let speed:VariableLongJava = try packet.readVarLong()
            let portal_teleport_boundary:VariableIntegerJava = try packet.readVarInt()
            let warningBlocks:VariableIntegerJava = try packet.readVarInt()
            let warningTime:VariableIntegerJava = try packet.readVarInt()
            return Self(x: x, z: z, oldDiameter: oldDiameter, newDiameter: newDiameter, speed: speed, portalTeleportBoundary: portal_teleport_boundary, warningBlocks: warningBlocks, warningTime: warningTime)
        }
        
        public let x:Double
        public let z:Double
        /// Current length of a single side of the world border, in meters.
        public let oldDiameter:Double
        /// Target length of a single side of the world border, in meters.
        public let newDiameter:Double
        /// Number of real-time _milliseconds_ until New Diameter is reached. It appears that Notchian server does not sync world border speed to game ticks, so it gets out of sync with server lag. If the world border is not moving, this is set to 0.
        public let speed:VariableLongJava
        /// Resulting coordinates from a portal teleport are limited to ±value. Usually 29999984.
        public let portalTeleportBoundary:VariableIntegerJava
        /// In meters.
        public let warningBlocks:VariableIntegerJava
        /// In seconds as set by `/worldborder warning time`.
        public let warningTime:VariableIntegerJava

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [
                x,
                z,
                oldDiameter,
                newDiameter,
                speed,
                portalTeleportBoundary,
                warningBlocks,
                warningTime
            ]
        }
    }
}
