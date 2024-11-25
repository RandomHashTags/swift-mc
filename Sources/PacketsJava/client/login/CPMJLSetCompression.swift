//
//  CPMJLSetCompression.swift
//
//
//  Created by Evan Anderson on 8/3/23.
//

import Packets

extension ClientPacket.Mojang.Java.Login {
    /// Enables compression. If compression is enabled, all following packets are encoded in the compressed packet format. Negative values will disable compression, meaning the packet format should remain in the uncompressed packet format. However, this packet is entirely optional, and if not sent, compression will also not be enabled (the notchian server does not send the packet when compression is disabled).
    struct SetCompression : ClientPacketMojangJavaLoginProtocol {
        public static let id:ClientPacket.Mojang.Java.Login = ClientPacket.Mojang.Java.Login.setCompression
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let threshold:VariableIntegerJava = try packet.readVarInt()
            return Self(threshold: threshold)
        }
        
        /// Maximum size of a packet before it is compressed.
        public let threshold:VariableIntegerJava
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [threshold]
        }
    }
}
