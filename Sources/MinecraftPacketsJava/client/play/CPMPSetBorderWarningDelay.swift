
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    public struct SetBorderWarningDelay: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.setBorderWarningDelay

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let warningTime:VariableIntegerJava = try packet.readVarInt()
            return Self(warningTime: warningTime)
        }
        
        /// In seconds as set by `/worldborder warning time`.
        public let warningTime:VariableIntegerJava

        public init(
            warningTime: VariableIntegerJava
        ) {
            self.warningTime = warningTime
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [warningTime]
        }
    }
}
