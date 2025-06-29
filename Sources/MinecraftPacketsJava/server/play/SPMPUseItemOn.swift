import MinecraftPackets

public extension ServerPacket.Mojang.Java.Play {
    /// !
    ///
    /// Upon placing a block, this packet is sent once.
    ///
    /// The Cursor Position X/Y/Z fields (also known as in-block coordinates) are calculated using raytracing. The unit corresponds to sixteen pixels in the default resource pack. For example, let's say a slab is being placed against the south face of a full block. The Cursor Position X will be higher if the player was pointing near the right (east) edge of the face, lower if pointing near the left. The Cursor Position Y will be used to determine whether it will appear as a bottom slab (values 0.0–0.5) or as a top slab (values 0.5-1.0). The Cursor Position Z should be 1.0 since the player was looking at the southernmost part of the block.
    ///
    /// Inside block is true when a player's head (specifically eyes) are inside of a block's collision. In 1.13 and later versions, collision is rather complicated and individual blocks can have multiple collision boxes. For instance, a ring of vines has a non-colliding hole in the middle. This value is only true when the player is directly in the box. In practice, though, this value is only used by scaffolding to place in front of the player when sneaking inside of it (other blocks will place behind when you intersect with them -- try with glass for instance).
    struct UseItemOn: ServerPacketMojangJavaPlayProtocol {
        public static let id:ServerPacket.Mojang.Java.Play = ServerPacket.Mojang.Java.Play.useItemOn
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let hand:UseItemOn.Hand = try packet.readEnum()
            let location:PositionPacketMojang = try packet.readPacket()
            let face:PlayerAction.Face = try packet.readEnum()
            let cursor_position_x:Float = try packet.readFloat()
            let cursor_position_y:Float = try packet.readFloat()
            let cursor_position_z:Float = try packet.readFloat()
            let inside_block:Bool = try packet.readBool()
            let sequence:VariableIntegerJava = try packet.readVarInt()
            return Self(hand: hand, location: location, face: face, cursor_position_x: cursor_position_x, cursor_position_y: cursor_position_y, cursor_position_z: cursor_position_z, inside_block: inside_block, sequence: sequence)
        }
        
        public let hand:UseItemOn.Hand
        /// Block position.
        public let location:PositionPacketMojang
        /// The face on which the block is placed (as documented at [Player Action](https://wiki.vg/Protocol#Player_Action )).
        public let face:PlayerAction.Face
        /// The position of the crosshair on the block, from 0 to 1 increasing from west to east.
        public let cursor_position_x:Float
        /// The position of the crosshair on the block, from 0 to 1 increasing from bottom to top.
        public let cursor_position_y:Float
        /// The position of the crosshair on the block, from 0 to 1 increasing from north to south.
        public let cursor_position_z:Float
        /// True when the player's head is inside of a block.
        public let inside_block:Bool
        public let sequence:VariableIntegerJava
        
        public enum Hand: Int, Codable, PacketEncodableMojangJava {
            case main_hand
            case off_hand
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [
                hand,
                location,
                face,
                cursor_position_x,
                cursor_position_y,
                cursor_position_z,
                inside_block,
                sequence
            ]
        }
    }
}
