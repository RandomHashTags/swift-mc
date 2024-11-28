//
//  CPMPPlayerChatMessage.swift
//  
//
//  Created by Evan Anderson on 8/8/23.
//

import Foundation
import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    struct PlayerChatMessage : ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.playerChatMessage
        
        // MARK: Header
        /// Used by the Notchian client for the disableChat launch option. Setting both longs to 0 will always display the message regardless of the setting.
        public let sender:UUID
        public let index:VariableIntegerJava
        public let messageSignaturePresent:Bool
        /// Only present if `messageSignaturePresent` is true. Cryptography, the signature consists of the Sender UUID, Session UUID from the [Player Session](https://wiki.vg/Protocol#Player_Session) packet, Index, Salt, Timestamp in epoch seconds, the length of the original chat content, the original content itself, the length of Previous Messages, and all of the Previous message signatures. These values are hashed with [SHA-256](https://en.wikipedia.org/wiki/SHA-2) and signed using the [RSA](https://en.wikipedia.org/wiki/RSA_(cryptosystem)) cryptosystem. Modifying any of these values in the packet will cause this signature to fail. This buffer is always 256 bytes long and it is not length-prefixed.
        public let messageSignatureBytes:[UInt8]?
        
        // MARK: Body
        public let message:String
        /// Represents the time the message was signed as milliseconds since the [epoch](https://en.wikipedia.org/wiki/Unix_time ), used to check if the message was received within 2 minutes of it being sent.
        public let timestamp:Int64
        /// Cryptography, used for validating the message signature.
        public let salt:Int64
        
        // MARK: Previous Messages
        /// The maximum length is 20 in Notchian client.
        public let totalPreviousMessages:VariableIntegerJava
        /// The message Id + 1, used for validating message signature. The next field is present only when value of this field is equal to -1.
        public let messageIDs:[VariableIntegerJava]
        /// The previous message's signature. Contains the same type of data as `messageSignatureBytes` above.
        public let signatures:[Int8]?
        
        // MARK: Other
        public let unsignedContentPresent:Bool
        public let unsignedContent:ChatPacketMojang?
        /// If the message has been filtered
        public let filterType:FilterType
        /// Only present if the Filter Type is Partially Filtered.
        public let filterTypeBits:Data? = nil // TODO: fix (make BitSet)
        
        // MARK: Network target
        /// The chat type from the [Login (play)](https://wiki.vg/Protocol#Login_.28play.29) packet used for this message
        public let chatType:VariableIntegerJava
        public let networkName:ChatPacketMojang
        public let networkTargetNamePresent:Bool
        public let networkTargetName:ChatPacketMojang?
        
        public enum FilterType : Int, Codable, PacketEncodableMojangJava {
            case pass_through
            case fully_filtered
            case partially_filtered
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] { // TODO: fix
            var array:[(any PacketEncodableMojangJava)?] = [
                sender,
                index,
                messageSignaturePresent
            ]
            if messageSignaturePresent {
                let messageSignatureBytes:[UInt8] = try unwrapOptional(messageSignatureBytes, key_path: \Self.messageSignatureBytes, precondition: "messageSignaturePresent == true")
                array.append(contentsOf: messageSignatureBytes)
            }
            
            var secondary:[(any PacketEncodableMojangJava)?] = [
                message,
                timestamp,
                salt,
                
                totalPreviousMessages
            ]
            secondary.append(contentsOf: messageIDs)
            if totalPreviousMessages.value == -1 {
                let signatures:[Int8] = try unwrapOptional(signatures, key_path: \Self.signatures, precondition: "totalPreviousMessages.value == -1")
                secondary.append(contentsOf: signatures)
            }
            secondary.append(unsignedContentPresent)
            if unsignedContentPresent {
                let unsignedContent:ChatPacketMojang = try unwrapOptional(unsignedContent, key_path: \Self.unsignedContent, precondition: "unsignedContentPresent == true")
                secondary.append(unsignedContent)
            }
            secondary.append(filterType)
            if filterType == .partially_filtered {
                let filterTypeBits:Data = try unwrapOptional(filterTypeBits, key_path: \Self.filterTypeBits, precondition: "filterType == .partially_filtered")
                secondary.append(filterTypeBits)
            }
            array.append(contentsOf: secondary)
            
            secondary = [
                chatType,
                networkName,
                networkTargetNamePresent
            ]
            if networkTargetNamePresent {
                let networkTargetName:ChatPacketMojang = try unwrapOptional(networkTargetName, key_path: \Self.networkTargetName, precondition: "networkTargetNamePresent == true")
                secondary.append(networkTargetName)
            }
            array.append(contentsOf: secondary)
            
            return array
        }
    }
}
