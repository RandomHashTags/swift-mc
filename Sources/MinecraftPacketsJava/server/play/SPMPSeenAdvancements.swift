
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    public struct SeenAdvancements: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.seenAdvancements
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let action:SeenAdvancements.Action = try packet.readEnum()
            let tabId:NamespaceJava? = action == .openedTab ? try packet.readIdentifier() : nil
            return Self(action: action, tabId: tabId)
        }
        
        public let action:SeenAdvancements.Action

        /// Only present if action is Opened tab.
        public let tabId:NamespaceJava?
        
        public enum Action: Int, Codable, PacketEncodableMojangJava {
            case openedTab
            case closedScreen
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[any PacketEncodableMojangJava] = [action]
            switch action {
            case .openedTab:
                let tabId = try unwrapOptional(tabId, key: \Self.tabId, precondition: "action == .opened_tab")
                array.append(tabId)
            case .closedScreen:
                break
            }
            return array
        }
    }
}
