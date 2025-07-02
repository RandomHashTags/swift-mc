
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    public struct ClickContainerButton: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.clickContainerButton
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let windowID = try packet.readByte()
            let buttonID = try packet.readByte()
            return Self(windowID: windowID, buttonID: buttonID)
        }
        
        /// The ID of the window sent by [Open Screen](https://wiki.vg/Protocol#Open_Screen ).
        public let windowID:Int8
        /// Meaning depends on window type.
        public let buttonID:Int8
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [windowID, buttonID]
        }
    }
}
