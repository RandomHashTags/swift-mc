
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    public struct ProgramCommandBlock: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.programCommandBlock
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let location:PositionPacketMojang = try packet.readPacket()
            let command = try packet.readString()
            let mode:ProgramCommandBlock.Mode = try packet.readEnum()
            let flags = try packet.readByte()
            return Self(location: location, command: command, mode: mode, flags: flags)
        }
        
        public let location:PositionPacketMojang

        public let command:String

        public let mode:ProgramCommandBlock.Mode

        /// 0x01: Track Output (if false, the output of the previous command will not be stored within the command block); 0x02: Is conditional; 0x04: Automatic.
        public let flags:Int8
        
        public enum Mode: Int, Codable, PacketEncodableMojangJava {
            case sequence
            case auto
            case redstone
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [location, command, mode, flags]
        }
    }
}
