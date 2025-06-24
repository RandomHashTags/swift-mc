
import Foundation
import MinecraftPackets

extension ClientPacket.Mojang.Java.Login {
    /// This packet switches the connection state to play.
    /// - Warning: The (notchian) server might take a bit to fully transition to the Play state, so it's recommended to wait for the Login (play) packet from the server.
    /// - Warning: The notchian client doesn't send any packets until the Login (play) packet.
    struct LoginSuccess: ClientPacketMojangJavaLoginProtocol {
        public static let id:ClientPacket.Mojang.Java.Login = ClientPacket.Mojang.Java.Login.loginSuccess
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let uuid:UUID = try packet.readUUID()
            let username:String = try packet.readString()
            let numberOfProperties:VariableIntegerJava = try packet.readVarInt()
            let properties:[LoginSuccess.Property] = try packet.readPacketArray(count: numberOfProperties.value_int)
            return Self(uuid: uuid, username: username, numberOfProperties: numberOfProperties, properties: properties)
        }
        
        public let uuid:UUID
        public let username:String
        /// Number of elements in `properties`.
        public let numberOfProperties:VariableIntegerJava
        public let properties:[LoginSuccess.Property]
        
        public struct Property: Codable, PacketEncodableMojangJava, PacketDecodableMojangJava {
            public static func decode<T: GeneralPacket>(from packet: T) throws -> Self {
                let name:String = try packet.readString()
                let value:String = try packet.readString()
                let is_signed:Bool = try packet.readBool()
                let signature:String? = is_signed ? try packet.readString() : nil
                return Self(name: name, value: value, is_signed: is_signed, signature: signature)
            }
            
            public let name:String
            public let value:String
            public let is_signed:Bool
            /// Only if `is_signed` is `true`.
            public let signature:String?
            
            public func packetBytes() throws -> [UInt8] {
                var array:[UInt8] = []
                array.append(contentsOf: try name.packetBytes())
                array.append(contentsOf: try value.packetBytes())
                array.append(contentsOf: try is_signed.packetBytes())
                if is_signed {
                    let signature:String = try unwrapOptional(signature, key_path: \Self.signature, precondition: "is_signed == true")
                    array.append(contentsOf: try signature.packetBytes())
                }
                return array
            }
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[(any PacketEncodableMojangJava)?] = [uuid, username, numberOfProperties]
            array.append(contentsOf: properties)
            return array
        }
    }
}
