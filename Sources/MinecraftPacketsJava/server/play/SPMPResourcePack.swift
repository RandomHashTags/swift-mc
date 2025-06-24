import MinecraftPackets

public extension ServerPacket.Mojang.Java.Play {
    struct ResourcePack: ServerPacketMojangJavaPlayProtocol {
        public static let id:ServerPacket.Mojang.Java.Play = ServerPacket.Mojang.Java.Play.resourcePack
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let result:ResourcePack.Result = try packet.readEnum()
            return Self(result: result)
        }
        
        public let result:ResourcePack.Result
        
        public enum Result: Int, Codable, PacketEncodableMojangJava {
            case successfully_loaded
            case declined
            case failed_download
            case accepted
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [result]
        }
    }
}
