
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// A combination of [Move Player Rotation](https://wiki.vg/Protocol#Set_Player_Rotation) and [Move Player Position](https://wiki.vg/Protocol#Set_Player_Position ).
    public struct SetPlayerPositionAndRotation: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.setPlayerPositionAndRotation

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let x = try packet.readDouble()
            let feetY = try packet.readDouble()
            let z = try packet.readDouble()
            let yaw = try packet.readFloat()
            let pitch = try packet.readFloat()
            let onGround = try packet.readBool()
            return Self(x: x, feetY: feetY, z: z, yaw: yaw, pitch: pitch, onGround: onGround)
        }
        
        /// Absolute position.
        public let x:Double

        /// Absolute feet position, normally Head Y - 1.62.
        public let feetY:Double

        /// Absolute position.
        public let z:Double

        /// Absolute rotation on the X Axis, in degrees.
        public let yaw:Float

        /// Absolute rotation on the Y Axis, in degrees.
        public let pitch:Float

        /// True if the client is on the ground, false otherwise.
        public let onGround:Bool

        public init(
            x: Double,
            feetY: Double,
            z: Double,
            yaw: Float,
            pitch: Float,
            onGround: Bool
        ) {
            self.x = x
            self.feetY = feetY
            self.z = z
            self.yaw = yaw
            self.pitch = pitch
            self.onGround = onGround
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [x, feetY, z, yaw, pitch, onGround]
        }
    }
}
