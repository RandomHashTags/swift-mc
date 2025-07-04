
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// 0–9 are the displayable destroy stages and each other number means that there is no animation on this coordinate.
    ///
    /// Block break animations can still be applied on air; the animation will remain visible although there is no block being broken. However, if this is applied to a transparent block, odd graphical effects may happen, including water losing its transparency. (An effect similar to this can be seen in normal gameplay when breaking ice blocks)
    ///
    /// If you need to display several break animations at the same time you have to give each of them a unique Entity ID. The entity ID does not need to correspond to an actual entity on the client. It is valid to use a randomly generated number.
    public struct SetBlockDestroyStage: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.setBlockDestroyStage
        
        /// The ID of the entity breaking the block.
        public let entityID:VariableIntegerJava

        /// Block Position.
        public let location:PositionPacketMojang

        /// 0–9 to set it, any other value to remove it.
        public let destroyStage:Int

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [entityID, location, destroyStage]
        }
    }
}
