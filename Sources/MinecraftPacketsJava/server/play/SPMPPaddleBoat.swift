import MinecraftPackets

public extension ServerPacket.Mojang.Java.Play {
    /// Used to _visually_ update whether boat paddles are turning. The server will update the [Boat entity metadata](https://wiki.vg/Entity_metadata#Boat) to match the values here.
    struct PaddleBoat: ServerPacketMojangJavaPlayProtocol {
        public static let id:ServerPacket.Mojang.Java.Play = ServerPacket.Mojang.Java.Play.paddleBoat
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let left_paddle_turning:Bool = try packet.readBool()
            let right_paddle_turning:Bool = try packet.readBool()
            return Self(left_paddle_turning: left_paddle_turning, right_paddle_turning: right_paddle_turning)
        }
        
        public let left_paddle_turning:Bool
        public let right_paddle_turning:Bool
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [left_paddle_turning, right_paddle_turning]
        }
    }
}
