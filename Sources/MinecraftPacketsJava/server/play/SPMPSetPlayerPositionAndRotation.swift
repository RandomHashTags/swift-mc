import MinecraftPackets

public extension ServerPacket.Mojang.Java.Play {
    /// A combination of [Move Player Rotation](https://wiki.vg/Protocol#Set_Player_Rotation) and [Move Player Position](https://wiki.vg/Protocol#Set_Player_Position ).
    struct SetPlayerPositionAndRotation: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.setPlayerPositionAndRotation
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let x:Double = try packet.readDouble()
            let feet_y:Double = try packet.readDouble()
            let z:Double = try packet.readDouble()
            let yaw:Float = try packet.readFloat()
            let pitch:Float = try packet.readFloat()
            let onGround:Bool = try packet.readBool()
            return Self(x: x, feet_y: feet_y, z: z, yaw: yaw, pitch: pitch, onGround: onGround)
        }
        
        /// Absolute position.
        public let x:Double
        /// Absolute feet position, normally Head Y - 1.62.
        public let feet_y:Double
        /// Absolute position.
        public let z:Double
        /// Absolute rotation on the X Axis, in degrees.
        public let yaw:Float
        /// Absolute rotation on the Y Axis, in degrees.
        public let pitch:Float
        /// True if the client is on the ground, false otherwise.
        public let onGround:Bool
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [x, feet_y, z, yaw, pitch, onGround]
        }
    }
}
