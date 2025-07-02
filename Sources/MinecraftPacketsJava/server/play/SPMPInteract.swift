
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// This packet is sent from the client to the server when the client attacks or right-clicks another entity (a player, minecart, etc).
    ///
    /// A Notchian server only accepts this packet if the entity being attacked/used is visible without obstruction and within a 4-unit radius of the player's position.
    ///
    /// The target X, Y, and Z fields represent the difference between the vector location of the cursor at the time of the packet and the entity's position.
    ///
    /// Note that middle-click in creative mode is interpreted by the client and sent as a [Set Creative Mode Slot](https://wiki.vg/Protocol#Set_Creative_Mode_Slot) packet instead.
    public struct Interact: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.interact
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let entityID:VariableIntegerJava = try packet.readVarInt()
            let type:Interact.InteractType = try packet.readEnum()
            let targetX:Float?
            let targetY:Float?
            let targetZ:Float?
            let hand:Interact.Hand?
            switch type {
            case .interact:
                targetX = nil
                targetY = nil
                targetZ = nil
                hand = try packet.readEnum()
            case .attack:
                targetX = nil
                targetY = nil
                targetZ = nil
                hand = nil
            case .interactAt:
                targetX = try packet.readFloat()
                targetY = try packet.readFloat()
                targetZ = try packet.readFloat()
                hand = try packet.readEnum()
            }
            let sneaking = try packet.readBool()
            return Self(entityID: entityID, type: type, targetX: targetX, targetY: targetY, targetZ: targetZ, hand: hand, sneaking: sneaking)
        }
        
        /// The ID of the entity to interact.
        public let entityID:VariableIntegerJava

        public let type:Interact.InteractType

        /// Only if Type is interact at.
        public let targetX:Float?

        /// Only if Type is interact at.
        public let targetY:Float?

        /// Only if Type is interact at.
        public let targetZ:Float?

        /// Only if Type is interact or interact at.
        public let hand:Interact.Hand?

        /// If the client is sneaking.
        public let sneaking:Bool
        
        public enum InteractType: Int, PacketEncodableMojangJava {
            case interact
            case attack
            case interactAt
        }
        public enum Hand: Int, PacketEncodableMojangJava {
            case mainHand
            case offHand
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[any PacketEncodableMojangJava] = [entityID, type]
            switch type {
            case .interact:
                let hand = try unwrapOptional(hand, key: \Self.hand, precondition: "type == .interact")
                array.append(hand)
            case .attack:
                break
            case .interactAt:
                let precondition = "type == .interact_at"
                let x = try unwrapOptional(targetX, key: \Self.targetX, precondition: precondition)
                let y = try unwrapOptional(targetY, key: \Self.targetY, precondition: precondition)
                let z = try unwrapOptional(targetZ, key: \Self.targetZ, precondition: precondition)
                let hand = try unwrapOptional(hand, key: \Self.hand, precondition: precondition)
                array.append(contentsOf: [x, y, z])
                array.append(hand)
            }
            array.append(sneaking)
            return array
        }
    }
}
