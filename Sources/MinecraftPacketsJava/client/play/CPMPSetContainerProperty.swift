
import MinecraftPackets

/// This packet is used to inform the client that part of a GUI window should be updated.
extension ClientPacket.Mojang.Java.Play {
    public struct SetContainerProperty: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.setContainerProperty

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let windowID = try packet.readUnsignedByte()
            let property = try packet.readShort()
            let value = try packet.readShort()
            return Self(windowID: windowID, property: property, value: value)
        }
        
        public let windowID:UInt8

        /// The property to be updated.
        public let property:Int16

        /// The new value for the property.
        public let value:Int16

        public init(
            windowID: UInt8,
            property: Int16,
            value: Int16
        ) {
            self.windowID = windowID
            self.property = property
            self.value = value
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [windowID, property, value]
        }
    }
}
