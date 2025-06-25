
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif
import MinecraftPackets

extension ClientPacket.Mojang.Java.Status {
    public struct StatusResponse: ClientPacketMojangJavaStatusProtocol {
        public static let id = ClientPacket.Mojang.Java.Status.statusResponse
        
        /// See https://wiki.vg/Server_List_Ping#Response ; as with all strings this is prefixed by its length as a VarInt.
        public let jsonResponse:String
        
        public init(jsonResponse: String) {
            self.jsonResponse = jsonResponse
        }
        /*init(version: MinecraftProtocolVersion.Java, motd: String, enforces_secure_chat: Bool, online_players_count: Int) throws {
            let statusRequest:ServerPacketMojangStatusResponse = ServerPacketMojangStatusResponse(
                version: ServerPacketMojangStatusResponse.Version(
                    name: version.name,
                    protocol: version.rawValue
                ),
                players: ServerPacketMojangStatusResponse.Players(
                    max: 10,
                    online: online_players_count,
                    sample: [
                        ServerPacketMojangStatusResponse.Player(name: "thinkofdeath", id: UUID("4566e69f-c907-48ee-8d71-d7ba5aa00d20")!)
                    ]
                ),
                description: ChatPacketMojang(
                    text: motd,
                    translate: nil,
                    with: nil,
                    score: nil,
                    bold: nil,
                    italic: nil,
                    underlined: nil,
                    strikethrough: nil,
                    obfuscated: nil,
                    font: nil,
                    color: nil,
                    insertion: nil,
                    clickEvent: nil,
                    hoverEvent: nil,
                    extra: nil
                ),
                favicon: nil,
                enforcesSecureChat: enforces_secure_chat,
                previewsChat: true
            )
            let data:Data = try JSONEncoder().encode(statusRequest)
            guard let string:String = String(data: data, encoding: .utf8) else {
                throw DecodingError.valueNotFound(String.self, DecodingError.Context.init(codingPath: [], debugDescription: "couldn't convert statusRequest packet to JSON"))
            }
            json_response = string
        }*/

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [jsonResponse]
        }
    }
}

// MARK: Parse
extension ClientPacket.Mojang.Java.Status.StatusResponse {
    @inlinable
    public static func parse(_ packet: any GeneralPacket) throws -> Self {
        let jsonResponse:String = try packet.readString()
        return Self(jsonResponse: jsonResponse)
    }
}