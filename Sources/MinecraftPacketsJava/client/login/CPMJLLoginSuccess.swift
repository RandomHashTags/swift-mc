
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif
import MinecraftPackets

extension ClientPacket.Mojang.Java.Login {
    /// This packet switches the connection state to play.
    /// - Warning: The (notchian) server might take a bit to fully transition to the Play state, so it's recommended to wait for the Login (play) packet from the server.
    /// - Warning: The notchian client doesn't send any packets until the Login (play) packet.
    public struct LoginSuccess: ClientPacketMojangJavaLoginProtocol {
        public static let id = ClientPacket.Mojang.Java.Login.loginSuccess

        @inlinable
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let uuid:UUID = try packet.readUUID()
            let username:String = try packet.readString()
            let numberOfProperties:VariableIntegerJava = try packet.readVarInt()
            let properties:[Property] = try packet.readPacketArray(count: numberOfProperties.valueInt)
            return Self(uuid: uuid, username: username, numberOfProperties: numberOfProperties, properties: properties)
        }
        
        public let uuid:UUID
        public let username:String
        /// Number of elements in `properties`.
        public let numberOfProperties:VariableIntegerJava
        public let properties:[Property]

        public init(
            uuid: UUID,
            username: String,
            numberOfProperties: VariableIntegerJava,
            properties: [Property]
        ) {
            self.uuid = uuid
            self.username = username
            self.numberOfProperties = numberOfProperties
            self.properties = properties
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[(any PacketEncodableMojangJava)?] = [uuid, username, numberOfProperties]
            array.append(contentsOf: properties)
            return array
        }
    }
}

// MARK: Property
extension ClientPacket.Mojang.Java.Login.LoginSuccess {
    public struct Property: Codable, PacketEncodableMojangJava, PacketDecodableMojangJava {
        @inlinable
        public static func decode<T: GeneralPacket>(from packet: T) throws -> Self {
            let name:String = try packet.readString()
            let value:String = try packet.readString()
            let isSigned:Bool = try packet.readBool()
            let signature:String? = isSigned ? try packet.readString() : nil
            return Self(name: name, value: value, isSigned: isSigned, signature: signature)
        }
        
        public let name:String
        public let value:String
        public let isSigned:Bool
        /// Only if `isSigned` is `true`.
        public let signature:String?

        public init(
            name: String,
            value: String,
            isSigned: Bool,
            signature: String?
        ) {
            self.name = name
            self.value = value
            self.isSigned = isSigned
            self.signature = signature
        }

        @inlinable
        public func packetBytes() throws -> [UInt8] {
            var array:[UInt8] = []
            array.append(contentsOf: try name.packetBytes())
            array.append(contentsOf: try value.packetBytes())
            array.append(contentsOf: try isSigned.packetBytes())
            if isSigned {
                let signature:String = try unwrapOptional(signature, key_path: \Self.signature, precondition: "isSigned == true")
                array.append(contentsOf: try signature.packetBytes())
            }
            return array
        }
    }
}