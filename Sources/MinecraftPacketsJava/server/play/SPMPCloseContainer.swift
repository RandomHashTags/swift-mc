
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// This packet is sent by the client when closing a window.
    ///
    /// Notchian clients send a Close Window packet with Window ID 0 to close their inventory even though there is never an [Open Screen](https://wiki.vg/Protocol#Open_Screen) packet for the inventory.
    public struct CloseContainer: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.closeContainer
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let windowID = try packet.readUnsignedByte()
            return Self(windowID: windowID)
        }
        
        public let windowID:UInt8
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [windowID]
        }
    }
}
