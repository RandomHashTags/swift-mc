//
//  CPMPBlockAction.swift
//
//
//  Created by Evan Anderson on 8/2/23.
//

import Packets

extension ClientPacket.Mojang.Java.Play {
    /// This packet is used for a number of actions and animations performed by blocks, usually non-persistent. The client ignores the provided block type and instead uses the block state in their world.
    /// - Warning: This packet uses a block ID from the `minecraft:block` registry, not a block state.
    struct BlockAction : ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.blockAction
        
        /// Block coordinates.
        public let location:PositionPacketMojang
        /// Varies depending on block — see [Block Actions](https://wiki.vg/Block_Actions ).
        public let actionID:UInt8
        /// Varies depending on block — see [Block Actions](https://wiki.vg/Block_Actions ).
        public let actionParameter:UInt8
        /// The block type ID for the block. This value is unused by the Notchian client, as it will infer the type of block based on the given position.
        public let blockType:VariableIntegerJava
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [
                location,
                actionID,
                actionParameter,
                blockType
            ]
        }
    }
}
