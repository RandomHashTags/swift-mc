//
//  SPMPPaddleBoat.swift
//  
//
//  Created by Evan Anderson on 8/9/23.
//

import Foundation

public extension ServerPacketMojang.Play {
    /// Used to _visually_ update whether boat paddles are turning. The server will update the [Boat entity metadata](https://wiki.vg/Entity_metadata#Boat) to match the values here.
    struct PaddleBoat : ServerPacketMojangPlayProtocol {
        public static func parse(_ packet: GeneralPacketMojang) throws -> Self {
            let left_paddle_turning:Bool = try packet.read_bool()
            let right_paddle_turning:Bool = try packet.read_bool()
            return Self(left_paddle_turning: left_paddle_turning, right_paddle_turning: right_paddle_turning)
        }
        
        public let left_paddle_turning:Bool
        public let right_paddle_turning:Bool
        
        public func encoded_values() throws -> [(any PacketEncodableMojang)?] {
            return [left_paddle_turning, right_paddle_turning]
        }
    }
}