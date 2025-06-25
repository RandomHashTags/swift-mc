import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    struct SetActionBarText: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.setActionBarText
        
        public static func parse(_ packet: any GeneralPacket) throws -> ClientPacket.Mojang.Java.Play.SetActionBarText {
            let action_bar_text:ChatPacketMojang = try packet.readPacket()
            return Self(action_bar_text: action_bar_text)
        }
        
        /// Displays a message above the hotbar (the same as position 2 in [Player Chat Message](https://wiki.vg/Protocol#Player_Chat_Message )).
        public let action_bar_text:ChatPacketMojang
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [action_bar_text]
        }
    }
}
