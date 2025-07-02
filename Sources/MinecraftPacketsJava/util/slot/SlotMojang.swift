
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

import MinecraftPackets

/// The **Slot** data structure is how Minecraft represents an item and its associated data in the Minecraft Protocol.
public struct SlotMojang: PacketEncodableMojangJava, PacketDecodableMojangJava {
    /// True if there is an item in this position; false if it is empty.
    public let present:Bool

    /// Omitted if present is false. The item ID. Item IDs are distinct from block IDs; see Data Generators for more information
    public let itemID:VariableIntegerJava?

    /// Omitted if present is false.
    public let itemCount:Int8?

    /// Omitted if present is false.
    public let nbt:Data? // TODO: support NBT

    public init(
        present: Bool,
        itemID: VariableIntegerJava?,
        itemCount: Int8?,
        nbt: Data?
    ) {
        self.present = present
        self.itemID = itemID
        self.itemCount = itemCount
        self.nbt = nbt
    }

    @inlinable
    public func packetBytes() throws -> [UInt8] {
        var array:[UInt8] = try present.packetBytes()
        if present {
            let precondition = "present == true"
            let itemID = try unwrapOptional(itemID, key: \Self.itemID, precondition: precondition)
            let itemCount = try unwrapOptional(itemCount, key: \Self.itemCount, precondition: precondition)
            let nbt = try unwrapOptional(nbt, key: \Self.nbt, precondition: precondition)
            array.append(contentsOf: try itemID.packetBytes())
            array.append(contentsOf: try itemCount.packetBytes())
            array.append(contentsOf: try nbt.packetBytes())
        }
        return array
    }
}

// MARK: Decode
extension SlotMojang {
    @inlinable
    public static func decode<T: GeneralPacket>(from packet: inout T) throws -> Self {
        let present = try packet.readBool()
        let itemID:VariableIntegerJava?
        let itemCount:Int8?
        let nbt:Data?
        if present {
            itemID = try packet.readVarInt()
            itemCount = try packet.readByte()
            nbt = nil // TODO: fix
        } else {
            itemID = nil
            itemCount = nil
            nbt = nil
        }
        return Self(present: present, itemID: itemID, itemCount: itemCount, nbt: nbt)
    }
}