
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    public struct ClientCommand: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.clientCommand
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let action:ClientCommand.Action = try packet.readEnum()
            return Self(action: action)
        }
        
        public let action:ClientCommand.Action
        
        public enum Action: Int, Codable, PacketEncodableMojangJava {
            /// Sent when the client is ready to complete login and when the client is ready to respawn after death.
            case performRespawn = 0
            /// Sent when the client opens the Statistics menu.
            case requestStats = 1
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [action]
        }
    }
}
