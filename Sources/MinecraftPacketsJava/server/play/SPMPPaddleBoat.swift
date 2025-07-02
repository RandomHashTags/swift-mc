
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// Used to _visually_ update whether boat paddles are turning. The server will update the [Boat entity metadata](https://wiki.vg/Entity_metadata#Boat) to match the values here.
    public struct PaddleBoat: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.paddleBoat
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let leftPaddleTurning = try packet.readBool()
            let rightPaddleTurning = try packet.readBool()
            return Self(leftPaddleTurning: leftPaddleTurning, rightPaddleTurning: rightPaddleTurning)
        }
        
        public let leftPaddleTurning:Bool
        public let rightPaddleTurning:Bool
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [leftPaddleTurning, rightPaddleTurning]
        }
    }
}
