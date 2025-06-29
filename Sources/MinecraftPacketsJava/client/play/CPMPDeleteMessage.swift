import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    /// Removes a message from the client's chat. This only works for messages with signatures, system messages cannot be deleted with this packet.
    struct DeleteMessage: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.deleteMessage
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let signatureLength:VariableIntegerJava = try packet.readVarInt()
            let signature:[UInt8] = try packet.readByteArray(bytes: signatureLength.valueInt)
            return Self(signatureLength: signatureLength, signature: signature)
        }
        
        /// Length of Signature.
        public let signatureLength:VariableIntegerJava
        /// Bytes of the signature.
        public let signature:[UInt8]
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[(any PacketEncodableMojangJava)?] = [signatureLength]
            array.append(contentsOf: signature)
            return array
        }
    }
}
