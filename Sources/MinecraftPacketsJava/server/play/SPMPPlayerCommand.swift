
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// Sent by the client to indicate that it has performed certain actions: sneaking (crouching), sprinting, exiting a bed, jumping with a horse, and opening a horse's inventory while riding it.
    ///
    /// Leave bed is only sent when the “Leave Bed” button is clicked on the sleep GUI, not when waking up due today time.
    /// 
    /// Open horse inventory is only sent when pressing the inventory key (default: E) while on a horse — all other methods of opening a horse's inventory (involving right-clicking or shift-right-clicking it) do not use this packet.
    public struct PlayerCommand: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.playerCommand
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let entityID:VariableIntegerJava = try packet.readVarInt()
            let action:Action = try packet.readEnum()
            let jumpBoost:VariableIntegerJava = try packet.readVarInt()
            return Self(entityID: entityID, action: action, jumpBoost: jumpBoost)
        }
        
        public let entityID:VariableIntegerJava
        public let action:Action
        public let jumpBoost:VariableIntegerJava
        
        public enum Action: Int, Codable, PacketEncodableMojangJava {
            case startSneaking
            case stopSneaking
            case leaveBed
            case startSprinting
            case stopSprinting
            case startJumpWithHorse
            case stopJumpWithHorse
            case openHorseInventory
            case startFlyingWithElytra
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [entityID, action, jumpBoost]
        }
    }
}
