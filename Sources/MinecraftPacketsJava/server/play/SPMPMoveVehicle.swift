import MinecraftPackets

public extension ServerPacket.Mojang.Java.Play {
    /// Sent when a player moves in a vehicle. Fields are the same as in [Set Player Position and Rotation](https://wiki.vg/Protocol#Set_Player_Position_and_Rotation ). Note that all fields use absolute positioning and do not allow for relative positioning.
    struct MoveVehicle: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.moveVehicle
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let x:Double = try packet.readDouble()
            let y:Double = try packet.readDouble()
            let z:Double = try packet.readDouble()
            let yaw:Float = try packet.readFloat()
            let pitch:Float = try packet.readFloat()
            return Self(x: x, y: y, z: z, yaw: yaw, pitch: pitch)
        }
        
        /// Absolute position (X coordinate).
        public let x:Double
        /// Absolute position (Y coordinate).
        public let y:Double
        /// Absolute position (Z coordinate).
        public let z:Double
        /// Absolute rotation on the vertical axis, in degrees.
        public let yaw:Float
        /// Absolute rotation on the horizontal axis, in degrees.
        public let pitch:Float
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [x, y, z, yaw, pitch]
        }
    }
}
