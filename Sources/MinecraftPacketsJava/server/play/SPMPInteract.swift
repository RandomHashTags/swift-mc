import MinecraftPackets

public extension ServerPacket.Mojang.Java.Play {
    /// This packet is sent from the client to the server when the client attacks or right-clicks another entity (a player, minecart, etc).
    ///
    /// A Notchian server only accepts this packet if the entity being attacked/used is visible without obstruction and within a 4-unit radius of the player's position.
    ///
    /// The target X, Y, and Z fields represent the difference between the vector location of the cursor at the time of the packet and the entity's position.
    ///
    /// Note that middle-click in creative mode is interpreted by the client and sent as a [Set Creative Mode Slot](https://wiki.vg/Protocol#Set_Creative_Mode_Slot) packet instead.
    struct Interact: ServerPacketMojangJavaPlayProtocol {
        public static let id:ServerPacket.Mojang.Java.Play = ServerPacket.Mojang.Java.Play.interact
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let entityID:VariableIntegerJava = try packet.readVarInt()
            let type:Interact.InteractType = try packet.readEnum()
            let target_x:Float?
            let target_y:Float?
            let target_z:Float?
            let hand:Interact.Hand?
            switch type {
            case .interact:
                target_x = nil
                target_y = nil
                target_z = nil
                hand = try packet.readEnum()
                break
            case .attack:
                target_x = nil
                target_y = nil
                target_z = nil
                hand = nil
                break
            case .interact_at:
                target_x = try packet.readFloat()
                target_y = try packet.readFloat()
                target_z = try packet.readFloat()
                hand = try packet.readEnum()
                break
            }
            let sneaking:Bool = try packet.readBool()
            return Self(entityID: entityID, type: type, target_x: target_x, target_y: target_y, target_z: target_z, hand: hand, sneaking: sneaking)
        }
        
        /// The ID of the entity to interact.
        public let entityID:VariableIntegerJava
        public let type:Interact.InteractType
        /// Only if Type is interact at.
        public let target_x:Float?
        /// Only if Type is interact at.
        public let target_y:Float?
        /// Only if Type is interact at.
        public let target_z:Float?
        /// Only if Type is interact or interact at.
        public let hand:Interact.Hand?
        /// If the client is sneaking.
        public let sneaking:Bool
        
        public enum InteractType: Int, Codable, PacketEncodableMojangJava {
            case interact
            case attack
            case interact_at
        }
        public enum Hand: Int, Codable, PacketEncodableMojangJava {
            case main_hand
            case off_hand
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[any PacketEncodableMojangJava] = [entityID, type]
            switch type {
            case .interact:
                let hand:Interact.Hand = try unwrapOptional(hand, key_path: \Self.hand, precondition: "type == .interact")
                array.append(hand)
                break
            case .attack:
                break
            case .interact_at:
                let precondition:String = "type == .interact_at"
                let x:Float = try unwrapOptional(target_x, key_path: \Self.target_x, precondition: precondition)
                let y:Float = try unwrapOptional(target_y, key_path: \Self.target_y, precondition: precondition)
                let z:Float = try unwrapOptional(target_z, key_path: \Self.target_z, precondition: precondition)
                let hand:Interact.Hand = try unwrapOptional(hand, key_path: \Self.hand, precondition: precondition)
                array.append(contentsOf: [x, y, z])
                array.append(hand)
                break
            }
            array.append(sneaking)
            return array
        }
    }
}
