
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    public struct ResourcePack: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.resourcePack

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let result:Result = try packet.readEnum()
            return Self(result: result)
        }
        
        public let result:Result

        public init(
            result: Result
        ) {
            self.result = result
        }
        
        public enum Result: Int, Codable, PacketEncodableMojangJava {
            case successfullyLoaded
            case declined
            case failedDownload
            case accepted
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [result]
        }
    }
}
