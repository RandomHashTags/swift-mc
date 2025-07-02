
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// Sent whenever an entity should change animation.
    public struct EntityAnimation: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.entityAnimation
        
        public let entityID:VariableIntegerJava
        public let animationID:Int

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [entityID, animationID]
        }
    }
}
