import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// Clear the client's current title information, with the option to also reset it.
    public struct ClearTitles: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.clearTitles

        public let reset:Bool

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [reset]
        }
    }
}
