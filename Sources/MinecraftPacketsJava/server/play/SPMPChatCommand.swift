
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    public struct ChatCommand: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.chatCommand
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let command = try packet.readString()
            let timestamp = try packet.readLong()
            let salt = try packet.readLong()
            let arrayLength:VariableIntegerJava = try packet.readVarInt()
            let argumentNames = try packet.readStringArray(count: arrayLength.valueInt)
            let signatureByteCount:Int = 256
            let signatures:[[UInt8]] = try packet.readMap(count: arrayLength.valueInt, transform: {
                return try $0.readByteArray(bytes: signatureByteCount)
            })
            let messageCount:VariableIntegerJava = try packet.readVarInt()
            let acknowledged = try packet.readRemainingByteArray()
            return Self(command: command, timestamp: timestamp, salt: salt, arrayLength: arrayLength, argumentNames: argumentNames, signatures: signatures, messageCount: messageCount, acknowledged: acknowledged)
        }
        
        /// The command typed by the client.
        public let command:String

        /// The timestamp that the command was executed.
        public let timestamp:Int64

        /// The salt for the following argument signatures.
        public let salt:Int64

        /// Number of entries in the following array. The maximum length in Notchian server is 8.
        public let arrayLength:VariableIntegerJava

        /// The name of the arguments that are signed by the following signature.
        public let argumentNames:[String]

        /// The signatures that verify the arguments. Always 256 bytes and is not length-prefixed.
        public let signatures:[[UInt8]]

        public let messageCount:VariableIntegerJava

        public let acknowledged:[UInt8] // TODO: make Fixed BitSet
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[any PacketEncodableMojangJava] = [command, timestamp, salt, arrayLength]
            array.append(contentsOf: argumentNames)
            for signature in signatures {
                array.append(contentsOf: signature)
            }
            array.append(messageCount)
            array.append(contentsOf: acknowledged)
            return array
        }
    }
}
