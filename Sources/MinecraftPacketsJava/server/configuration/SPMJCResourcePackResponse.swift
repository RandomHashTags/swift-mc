//
//  SPMJCResourcePackResponse.swift
//
//
//  Created by Evan Anderson on 11/15/23.
//

import MinecraftPackets

extension ServerPacket.Mojang.Java.Configuration {
    struct ResourcePackResponse : ServerPacketMojangJavaConfigurationProtocol {
        public static let id:ServerPacket.Mojang.Java.Configuration = ServerPacket.Mojang.Java.Configuration.resourcePackResponse
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let result:Result = try packet.readEnum()
            return Self(result: result)
        }
        
        public let result:Result
        
        public enum Result : Int, Codable, PacketEncodableMojangJava {
            case successfully_loaded
            case declined
            case failed_download
            case accepted
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [result]
        }
    }
}
