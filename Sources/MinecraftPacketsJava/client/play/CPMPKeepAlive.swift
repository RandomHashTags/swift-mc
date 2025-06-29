import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    /// The server will frequently send out a keep-alive, each containing a random ID. The client must respond with the same payload (see [serverbound Keep Alive](https://wiki.vg/Protocol#Keep_Alive_2 )). If the client does not respond to them for over 30 seconds, the server kicks the client. Vice versa, if the server does not send any keep-alives for 20 seconds, the client will disconnect and yields a "Timed out" exception.
    ///
    /// The Notchian server uses a system-dependent time in milliseconds to generate the keep alive ID value.
    struct KeepAlive: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.keepAlive
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let keep_alive_id:Int64 = try packet.readLong()
            return Self(keep_alive_id: keep_alive_id)
        }
        
        public let keep_alive_id:Int64
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [keep_alive_id]
        }
    }
}
