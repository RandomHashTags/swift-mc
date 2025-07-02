
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

import MinecraftPackets

public protocol PacketEncodableMojangJava: PacketEncodable, ~Copyable {
}

extension PacketEncodableMojangJava where Self: RawRepresentable, RawValue: PacketEncodableMojangJava {
    @inlinable
    public func packetBytes() throws -> [UInt8] {
        try rawValue.packetBytes()
    }
}

extension FixedWidthInteger {
    @inlinable
    public func packetBytes() throws -> [UInt8] {
        var array:[UInt8] = []
        var value = self
        let segmentBits = Self(GeneralPacketMojang.segmentBits)
        while true {
            if (value & ~segmentBits) == 0 {
                array.append(UInt8(value))
                break
            }
            array.append(UInt8( (value & segmentBits) | Self(GeneralPacketMojang.continueBit)) )
            value >>= 7
        }
        return array
    }
}

extension Int: PacketEncodableMojangJava {}
extension Int8: PacketEncodableMojangJava {}
extension Int16: PacketEncodableMojangJava, PacketDecodableMojangJava {
    @inlinable
    public static func decode<T: GeneralPacket>(from packet: inout T) throws -> Int16 {
        return try packet.readShort()
    }
}
extension Int32: PacketEncodableMojangJava {}
extension Int64: PacketEncodableMojangJava {}
extension UInt8: PacketEncodableMojangJava {}
extension UInt16: PacketEncodableMojangJava {}
extension UInt32: PacketEncodableMojangJava {}
extension UInt64: PacketEncodableMojangJava {}

extension Double: PacketEncodableMojangJava {
    // TODO: support
    @inlinable
    public func packetBytes() throws -> [UInt8] {
        var array:[UInt8] = []
        return array
    }
}
extension Float: PacketEncodableMojangJava {
    // TODO: support
    @inlinable
    public func packetBytes() throws -> [UInt8] {
        var array:[UInt8] = []
        return array
    }
}

extension String: PacketEncodableMojangJava {
    @inlinable
    public func packetBytes() throws -> [UInt8] {
        var array = Array(self.utf8)
        array.insert(contentsOf: try VariableIntegerJava(value: Int32(count)).packetBytes(), at: 0)
        return array
    }
}
extension UUID: PacketEncodableMojangJava {
    @inlinable
    public func packetBytes() throws -> [UInt8] {
        let bytes:(UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8) = self.uuid
        return [
            bytes.0, bytes.1, bytes.2, bytes.3, bytes.4, bytes.5, bytes.6, bytes.7,
            bytes.8, bytes.9, bytes.10, bytes.11, bytes.12, bytes.13, bytes.14, bytes.15
        ]
    }
}

extension Data: PacketEncodableMojangJava {
    @inlinable
    public func packetBytes() throws -> [UInt8] {
        return Array(self)
    }
}

extension Bool: PacketEncodableMojangJava {
    @inlinable
    public func packetBytes() throws -> [UInt8] {
        return [self ? 1 : 0]
    }
}
