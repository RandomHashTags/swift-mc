
import MinecraftPackets

extension ClientPacket.Mojang.Java.Configuration {
    /// Sent by the server to notify the client that the configuration process has finished. The client answers with its own [Finish Configuration](https://wiki.vg/Protocol#Finish_Configuration_2) whenever it is ready to continue.
    struct FinishConfiguration: ClientPacket.Mojang.Java.ConfigurationProtocol {
        public static let id = ClientPacket.Mojang.Java.Configuration.finishConfiguration

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return []
        }
    }
}
