
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// Sent when the player mines a block. A Notchian server only accepts digging packets with coordinates within a 6-unit radius between the center of the block and 1.5 units from the player's feet (_not_ their eyes).
    public struct PlayerAction: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.playerAction
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let status:Status = try packet.readEnum()
            let location:PositionPacketMojang = try packet.readPacket()
            let face:Face = try packet.readEnum()
            let sequence:VariableIntegerJava = try packet.readVarInt()
            return Self(status: status, location: location, face: face, sequence: sequence)
        }
        
        /// The action the player is taking against the block.
        public let status:Status
        /// Block position.
        public let location:PositionPacketMojang
        /// The face being hit.
        public let face:Face
        public let sequence:VariableIntegerJava
        
        public enum Status: Int, Codable, PacketEncodableMojangJava {
            case startedDigging
            /// Sent when the player lets go of the Mine Block key (default: left click).
            case cancelledDigging
            /// Sent when the client thinks it is finished.
            case finishedDigging
            /// Triggered by using the Drop Item key (default: Q) with the modifier to drop the entire selected stack (default: Control or Command, depending on OS). Location is always set to 0/0/0, Face is always set to -Y.
            case dropItemStack
            /// Triggered by using the Drop Item key (default: Q). Location is always set to 0/0/0, Face is always set to -Y.
            case dropItem
            /// Indicates that the currently held item should have its state updated such as eating food, pulling back bows, using buckets, etc. Location is always set to 0/0/0, Face is always set to -Y.
            case shootArrowOrFinishEating
            /// Used to swap or assign an item to the second hand. Location is always set to 0/0/0, Face is always set to -Y.
            case swapItemInHand
        }
        
        public enum Face: Int, Codable, PacketEncodableMojangJava {
            case botton
            case top
            case north
            case south
            case west
            case east
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [status, location, face, sequence]
        }
    }
}
