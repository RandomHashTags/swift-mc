/// This packet is used to inform the client that part of a GUI window should be updated.
import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    struct SetContainerProperty: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.setContainerProperty
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let windowID:UInt8 = try packet.readUnsignedByte()
            let property:Int16 = try packet.readShort()
            let value:Int16 = try packet.readShort()
            return Self(windowID: windowID, property: property, value: value)
        }
        
        public let windowID:UInt8
        /// The property to be updated.
        public let property:Int16
        /// The new value for the property.
        public let value:Int16
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [windowID, property, value]
        }
    }
}
