
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// This is sent to the client when it should display a scoreboard.
    public struct DisplayObjective: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.displayObjective
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let position = try packet.readByte()
            let scoreName = try packet.readString()
            return Self(position: position, scoreName: scoreName)
        }
        
        /// The position of the scoreboard. 0: list, 1: sidebar, 2: below name, 3 - 18: team specific sidebar, indexed as 3 + team color.
        public let position:Int8

        /// The unique name for the scoreboard to be displayed.
        public let scoreName:String
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [position, scoreName]
        }
    }
}
