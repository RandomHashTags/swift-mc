
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// This is sent to the client when it should update a scoreboard item.
    public struct UpdateScore: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.updateScore

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let entityName = try packet.readString()
            let action:Action = try packet.readEnum()
            let objectiveName = try packet.readString()
            let value:VariableIntegerJava?
            if action != .removeItem {
                value = try packet.readVarInt()
            } else {
                value = nil
            }
            return Self(entityName: entityName, action: action, objectiveName: objectiveName, value: value)
        }
        
        /// The entity whose score this is. For players, this is their username; for other entities, it is their UUID.
        public let entityName:String

        public let action:Action

        /// The name of the objective the score belongs to.
        public let objectiveName:String

        /// The score to be displayed next to the entry. Only sent when Action does not equal 1.
        public let value:VariableIntegerJava?

        public init(
            entityName: String,
            action: Action,
            objectiveName: String,
            value: VariableIntegerJava?
        ) {
            self.entityName = entityName
            self.action = action
            self.objectiveName = objectiveName
            self.value = value
        }
        
        public enum Action: Int, Codable, PacketEncodableMojangJava {
            case createOrUpdateItem = 0
            case removeItem = 1
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[(any PacketEncodableMojangJava)?] = [entityName, action, objectiveName]
            if action != .removeItem {
                let value = try unwrapOptional(value, key: \Self.value, precondition: "action.rawValue != 1")
                array.append(value)
            }
            return array
        }
    }
}
