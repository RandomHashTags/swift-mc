
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    public struct ServerData: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.serverData

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let messageOfTheDay:ChatPacketMojang = try packet.readPacket()
            let hasIcon = try packet.readBool()
            let icon = hasIcon ? try packet.readByteArray(bytes: packet.count) : nil // TODO: fix
            let enforcesSecureChat = try packet.readBool()
            return Self(messageOfTheDay: messageOfTheDay, hasIcon: hasIcon, icon: icon, enforcesSecureChat: enforcesSecureChat)
        }
        
        public let messageOfTheDay:ChatPacketMojang
        public let hasIcon:Bool
        public let icon:[UInt8]?
        public let enforcesSecureChat:Bool

        public init(
            messageOfTheDay: ChatPacketMojang,
            hasIcon: Bool,
            icon: [UInt8]?,
            enforcesSecureChat: Bool
        ) {
            self.messageOfTheDay = messageOfTheDay
            self.hasIcon = hasIcon
            self.icon = icon
            self.enforcesSecureChat = enforcesSecureChat
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[(any PacketEncodableMojangJava)?] = [messageOfTheDay, hasIcon]
            array.append(contentsOf: array)
            array.append(enforcesSecureChat)
            return array
        }
    }
}
