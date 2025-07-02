
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// Updates the client's location. This is used to determine what chunks should remain loaded and if a chunk load should be ignored; chunks outside of the view distance may be unloaded.
    ///
    /// Sent whenever the player moves across a chunk border horizontally, and also (according to testing) for any integer change in the vertical axis, even if it doesn't go across a chunk section border.
    ///
    /// > Warning: \[from wiki.vg]: Why is this even needed? Is there a better name for it? My guess is that it's something to do with logical behavior with latency, but it still seems weird.
    public struct SetCenterChunk: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.setCenterChunk

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let chunkX:VariableIntegerJava = try packet.readVarInt()
            let chunkZ:VariableIntegerJava = try packet.readVarInt()
            return Self(chunkX: chunkX, chunkZ: chunkZ)
        }
        
        public let chunkX:VariableIntegerJava
        public let chunkZ:VariableIntegerJava

        public init(
            chunkX: VariableIntegerJava,
            chunkZ: VariableIntegerJava
        ) {
            self.chunkX = chunkX
            self.chunkZ = chunkZ
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [chunkX, chunkZ]
        }
    }
}
