import MinecraftPackets

public extension ServerPacket.Mojang.Java.Play {
    /// Updates the player's XYZ position on the server.
    ///
    /// Checking for moving too fast is achieved like this:
    /// - Each server tick, the player's current position is stored
    /// - When a player moves, the changes in x, y, and z coordinates are compared with the positions from the previous tick (Δx, Δy, Δz)
    /// - Total movement distance squared is computed as Δx² + Δy² + Δz²
    /// - The expected movement distance squared is computed as velocityX² + velocityY² + velocityZ²
    ///
    /// If the total movement distance squared value minus the expected movement distance squared value is more than 100 (300 if the player is using an elytra), they are moving too fast.
    ///
    /// If the player is moving too fast, it will be logged that "<player> moved too quickly! " followed by the change in x, y, and z, and the player will be teleported back to their current (before this packet) serverside position.
    ///
    /// Also, if the absolute value of X or the absolute value of Z is a value greater than 3.2×107, or X, Y, or Z are not finite (either positive infinity, negative infinity, or NaN), the client will be kicked for “Invalid move player packet received”.
    struct SetPlayerPosition: ServerPacketMojangJavaPlayProtocol {
        public static let id:ServerPacket.Mojang.Java.Play = ServerPacket.Mojang.Java.Play.setPlayerPosition
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let x:Double = try packet.readDouble()
            let feet_y:Double = try packet.readDouble()
            let z:Double = try packet.readDouble()
            let onGround:Bool = try packet.readBool()
            return Self(x: x, feet_y: feet_y, z: z, onGround: onGround)
        }
        
        /// Absolute position.
        public let x:Double
        /// Absolute feet position, normally Head Y - 1.62.
        public let feet_y:Double
        /// Absolute position.
        public let z:Double
        /// True if the client is on the ground, false otherwise.
        public let onGround:Bool
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [x, feet_y, z, onGround]
        }
    }
}
