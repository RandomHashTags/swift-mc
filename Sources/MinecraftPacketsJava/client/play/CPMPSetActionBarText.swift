
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    public struct SetActionBarText: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.setActionBarText

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> ClientPacket.Mojang.Java.Play.SetActionBarText {
            let actionBarText:ChatPacketMojang = try packet.readPacket()
            return Self(actionBarText: actionBarText)
        }
        
        /// Displays a message above the hotbar (the same as position 2 in [Player Chat Message](https://wiki.vg/Protocol#Player_Chat_Message )).
        public let actionBarText:ChatPacketMojang

        public init(
            actionBarText: ChatPacketMojang
        ) {
            self.actionBarText = actionBarText
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [actionBarText]
        }
    }
}
