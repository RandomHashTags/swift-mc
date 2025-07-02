
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    public struct SeenAdvancements: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.seenAdvancements

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let action:Action = try packet.readEnum()
            let tabID:NamespaceJava? = action == .openedTab ? try packet.readIdentifier() : nil
            return Self(action: action, tabID: tabID)
        }
        
        public let action:Action

        /// Only present if action is Opened tab.
        public let tabID:NamespaceJava?

        public init(
            action: Action,
            tabID: NamespaceJava?
        ) {
            self.action = action
            self.tabID = tabID
        }
        
        public enum Action: Int, Codable, PacketEncodableMojangJava {
            case openedTab
            case closedScreen
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[any PacketEncodableMojangJava] = [action]
            switch action {
            case .openedTab:
                let tabID = try unwrapOptional(tabID, key: \Self.tabID, precondition: "action == .opened_tab")
                array.append(tabID)
            case .closedScreen:
                break
            }
            return array
        }
    }
}
