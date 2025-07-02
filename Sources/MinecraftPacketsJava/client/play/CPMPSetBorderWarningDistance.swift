
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    public struct SetBorderWarningDistance: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.setBorderWarningDistance

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let warningBlocks:VariableIntegerJava = try packet.readVarInt()
            return Self(warningBlocks: warningBlocks)
        }
        
        /// In meters.
        public let warningBlocks:VariableIntegerJava

        public init(
            warningBlocks: VariableIntegerJava
        ) {
            self.warningBlocks = warningBlocks
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [warningBlocks]
        }
    }
}
