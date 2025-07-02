
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// Sent when the player connects, or when settings are changed.
    ///
    /// _Displayed Skin Parts_ flags:
    /// - Bit 0 (0x01): Cape enabled
    /// - Bit 1 (0x02): Jacket enabled
    /// - Bit 2 (0x04): Left Sleeve enabled
    /// - Bit 3 (0x08): Right Sleeve enabled
    /// - Bit 4 (0x10): Left Pants Leg enabled
    /// - Bit 5 (0x20): Right Pants Leg enabled
    /// - Bit 6 (0x40): Hat enabled
    ///
    /// The most significant bit (bit 7, 0x80) appears to be unused.
    public struct ClientInformation: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.clientInformation
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let locale = try packet.readString()
            let viewDistance = try packet.readByte()
            let chatMode:ClientInformation.ChatMode = try packet.readEnum()
            let chatColors = try packet.readBool()
            let displayedSkinParts = try packet.readUnsignedByte()
            let mainHand:ClientInformation.MainHand = try packet.readEnum()
            let enableTextFiltering = try packet.readBool()
            let allowServerListings = try packet.readBool()
            return Self(locale: locale, viewDistance: viewDistance, chatMode: chatMode, chatColors: chatColors, displayedSkinParts: displayedSkinParts, mainHand: mainHand, enableTextFiltering: enableTextFiltering, allowServerListings: allowServerListings)
        }
        
        /// e.g. `en_GB`.
        public let locale:String

        /// Client-side render distance, in chunks.
        public let viewDistance:Int8

        /// See [processing chat](https://wiki.vg/Chat#Processing_chat) for more information.
        public let chatMode:ClientInformation.ChatMode

        /// “Colors” multiplayer setting. Can the chat be colored?
        public let chatColors:Bool

        public let displayedSkinParts:UInt8

        public let mainHand:ClientInformation.MainHand

        /// Enables filtering of text on signs and written book titles. Currently always false (i.e. the filtering is disabled)
        public let enableTextFiltering:Bool

        /// Servers usually list online players, this option should let you not show up in that list.
        public let allowServerListings:Bool
        
        public enum ChatMode: Int, Codable, PacketEncodableMojangJava {
            case enabled
            case commandsOnly
            case hidden
        }
        
        public enum MainHand: Int, Codable, PacketEncodableMojangJava {
            case left
            case right
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [
                locale,
                viewDistance,
                chatMode,
                chatColors,
                displayedSkinParts,
                mainHand,
                enableTextFiltering,
                allowServerListings
            ]
        }
    }
}
