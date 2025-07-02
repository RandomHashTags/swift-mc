
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol GeneralPacket: Sendable, ~Copyable {
    /// The number of bytes it takes to represent this packet.
    var count: Int { get }

    init(bytes: [UInt8]) throws

    mutating func readByte() throws -> Int8
    mutating func readUnsignedByte() throws -> UInt8

    mutating func readShort() throws -> Int16
    mutating func readUnsignedShort() throws -> UInt16

    mutating func readVarInt<T: VariableInteger>() throws -> T
    mutating func readVarLong<T: VariableLong>() throws -> T

    mutating func readInt() throws -> Int32
    mutating func readLong() throws -> Int64
    mutating func readUnsignedLong() throws -> UInt64

    mutating func readFloat() throws -> Float
    mutating func readDouble() throws -> Double

    mutating func readString() throws -> String
    mutating func readBool() throws -> Bool
    mutating func readIdentifier<T: Namespace>() throws -> T
    
    mutating func readEnum<T: PacketEncodable & RawRepresentable<Int>>() throws -> T

    mutating func readByteArray(bytes: Int) throws -> [UInt8]
    mutating func readRemainingByteArray() throws -> [UInt8]
    mutating func readRemainingOptionalByteArray() throws -> [UInt8]?
    mutating func readStringArray(count: Int) throws -> [String]

    mutating func readMap<T>(count: Int, transform: (inout Self) throws -> T) rethrows -> [T]

    mutating func readUUID() throws -> UUID
    mutating func readData(bytes: Int) throws -> Data

    mutating func readPacket<T: PacketDecodable>() throws -> T
    mutating func readPacketArray<T: PacketDecodable>(count: Int) throws -> [T]

    mutating func readAngle<T: Angle>() throws -> T
}
