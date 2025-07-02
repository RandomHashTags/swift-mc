
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// This message is sent from the client to the server when the “Done” button is pushed after placing a sign.
    ///
    /// The server only accepts this packet after [Open Sign Editor](https://wiki.vg/Protocol#Open_Sign_Editor ), otherwise this packet is silently ignored.
    public struct UpdateSign: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.updateSign
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let location:PositionPacketMojang = try packet.readPacket()
            let isFrontText = try packet.readBool()
            let line1 = try packet.readString()
            let line2 = try packet.readString()
            let line3 = try packet.readString()
            let line4 = try packet.readString()
            return Self(location: location, isFrontText: isFrontText, line1: line1, line2: line2, line3: line3, line4: line4)
        }
        
        /// Block Coordinates.
        public let location:PositionPacketMojang

        /// Whether the updated text is in front or on the back of the sign.
        public let isFrontText:Bool

        public let line1:String
        public let line2:String
        public let line3:String
        public let line4:String

        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [
                location,
                isFrontText,
                line1,
                line2,
                line3,
                line4
            ]
        }
    }
}
