
import MinecraftPackets

extension ClientPacket.Mojang.Java.Configuration {
    public struct ResourcePack: ClientPacket.Mojang.Java.ConfigurationProtocol {
        public static let id = ClientPacket.Mojang.Java.Configuration.resourcePack
        
        /// The URL to the resource pack.
        public let url:String
        /// A 40 character hexadecimal and lowercase [SHA-1](http://en.wikipedia.org/wiki/SHA-1) hash of the resource pack file.
        /// If it's not a 40 character hexadecimal string, the client will not use it for hash verification and likely waste bandwidth — but it will still treat it as a unique id
        public let hash:String
        /// The notchian client will be forced to use the resource pack from the server. If they decline they will be kicked from the server.
        public let forced:Bool
        /// `true` If the next field will be sent `false` otherwise. When `false`, this is the end of the packet.
        public let hasPromptMessage:Bool
        /// This is shown in the prompt making the client accept or decline the resource pack.
        public let promptMessage:ChatPacketMojang?

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var values:[(any PacketEncodableMojangJava)?] = [url, hash, forced, hasPromptMessage]
            if hasPromptMessage {
                values.append(promptMessage)
            }
            return values
        }
    }
}
