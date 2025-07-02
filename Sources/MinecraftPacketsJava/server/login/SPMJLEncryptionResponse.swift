
import MinecraftPackets

extension ServerPacket.Mojang.Java.Login {
    /// See [Protocol Encryption](https://wiki.vg/Protocol_Encryption) for details. See [Mojang\_API#Player\_Certificates](https://wiki.vg/Mojang_API#Player_Certificates) for an API to get the message signature.
    public struct EncryptionResponse: ServerPacketMojangJavaLoginProtocol {
        public static let id = ServerPacket.Mojang.Java.Login.encryptionResponse

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let sharedSecretLength:VariableIntegerJava = try packet.readVarInt()
            let sharedSecret = try packet.readByteArray(bytes: sharedSecretLength.valueInt)
            let verifyTokenLength:VariableIntegerJava = try packet.readVarInt()
            let verifyToken = try packet.readByteArray(bytes: verifyTokenLength.valueInt)
            return Self(sharedSecretLength: sharedSecretLength, sharedSecret: sharedSecret, verifyTokenLength: verifyTokenLength, verifyToken: verifyToken)
        }
        
        public let sharedSecretLength:VariableIntegerJava

        /// Shared Secret value, encrypted with the server's public key.
        public let sharedSecret:[UInt8]

        public let verifyTokenLength:VariableIntegerJava

        /// Verify Token value, encrypted with the same public key as the shared secret.
        public let verifyToken:[UInt8]

        public init(
            sharedSecretLength: VariableIntegerJava,
            sharedSecret: [UInt8],
            verifyTokenLength: VariableIntegerJava,
            verifyToken: [UInt8]
        ) {
            self.sharedSecretLength = sharedSecretLength
            self.sharedSecret = sharedSecret
            self.verifyTokenLength = verifyTokenLength
            self.verifyToken = verifyToken
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var values:[any PacketEncodableMojangJava] = [sharedSecretLength]
            values.append(contentsOf: sharedSecret)
            values.append(verifyTokenLength)
            values.append(contentsOf: verifyToken)
            return values
        }
    }
}
