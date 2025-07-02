
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    public struct PlayerSession: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.playerSession
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let sessionID = try packet.readUUID()
            let expiresAt = try packet.readLong()
            let publicKeyLength:VariableIntegerJava = try packet.readVarInt()
            let publicKey = try packet.readByteArray(bytes: publicKeyLength.valueInt)
            let keySignatureLength:VariableIntegerJava = try packet.readVarInt()
            let keySignature = try packet.readByteArray(bytes: keySignatureLength.valueInt)
            return Self(sessionID: sessionID, expiresAt: expiresAt, publicKeyLength: publicKeyLength, publicKey: publicKey, keySignatureLength: keySignatureLength, keySignature: keySignature)
        }
        
        public let sessionID:UUID

        /// The time the play session key expires in [epoch](https://en.wikipedia.org/wiki/Unix_time) milliseconds.
        public let expiresAt:Int64

        /// Length of the proceeding public key. Maximum length in Notchian server is 512 bytes.
        public let publicKeyLength:VariableIntegerJava

        /// A byte array of an X.509-encoded public key.
        public let publicKey:[UInt8]

        /// Length of the proceeding key signature array. Maximum length in Notchian server is 4096 bytes.
        public let keySignatureLength:VariableIntegerJava

        /// The signature consists of the player UUID, the key expiration timestamp, and the public key data. These values are hashed using [SHA-1](https://en.wikipedia.org/wiki/SHA-1) and signed using Mojang's private [RSA](https://en.wikipedia.org/wiki/RSA_(cryptosystem)) key.
        public let keySignature:[UInt8]
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[any PacketEncodableMojangJava] = [sessionID, expiresAt, publicKeyLength]
            array.append(contentsOf: publicKey)
            array.append(keySignatureLength)
            array.append(contentsOf: keySignature)
            return array
        }
    }
}
