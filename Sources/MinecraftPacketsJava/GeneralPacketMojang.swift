
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

import MinecraftPackets
import MinecraftUtilities

extension Array where Element == UInt8 {
    @inlinable
    func readVarInt(byteOffset: Int = 0) throws -> (result: VariableIntegerJava, read_bytes: Int) {
        var value:Int32 = 0
        var position:Int = 0
        var currentByte:UInt8 = 0
        var _readingIndex:Int = byteOffset
        while true {
            currentByte = self[_readingIndex]
            _readingIndex += 1
            value |= Int32(currentByte & GeneralPacketMojang.segmentBits) << position
            
            if currentByte & GeneralPacketMojang.continueBit == 0 {
                break
            }
            position += 7
            if position >= 32 {
                throw GeneralPacketError.varintTooBig
            }
        }
        return (VariableIntegerJava(value: value), _readingIndex - byteOffset)
    }
}

public struct GeneralPacketMojang: GeneralPacket {
    @inlinable
    public static func == (lhs: GeneralPacketMojang, rhs: GeneralPacketMojang) -> Bool {
        return lhs.length == rhs.length && lhs.packetID == rhs.packetID && lhs.data.elementsEqual(rhs.data)
    }
    
    public static let segmentBits:UInt8 = 0x7F
    public static let continueBit:UInt8 = 0x80
    
    public let length:VariableIntegerJava
    public var count: Int { length.valueInt }
    public let packetID:VariableIntegerJava
    public let data:ArraySlice<UInt8>

    @usableFromInline
    var _readingIndex:Int = 0
    
    public init(bytes: [UInt8]) throws {
        let (length, length_read_bytes) = try bytes.readVarInt()
        self.length = length
        let (packetID, packet_read_bytes) = try bytes.readVarInt(byteOffset: length_read_bytes)
        self.packetID = packetID
        let offset = length_read_bytes + packet_read_bytes
        data = bytes[offset..<bytes.count]
        _readingIndex = offset
        //print("GeneralPacketMojang;length=\(length);packetID=\(packetID);offset=\(offset);data=" + data.description + ";bytes=" + bytes.description)
    }

    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(length)
        hasher.combine(packetID)
        hasher.combine(data)
    }

    @inlinable
    public var readingIndex: Int {
        _readingIndex
    }
}

// MARK: Bytes
extension GeneralPacketMojang {
    @inlinable
    mutating func fromBytesInteger<T: FixedWidthInteger>(bytes: Int) throws -> T {
        let slice = [UInt8](data[_readingIndex..<_readingIndex + bytes])
        guard slice.count == MemoryLayout<T>.size else {
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "bruh;slice.count=\(slice.count);memorylayout.size=\(MemoryLayout<T>.size)")) // TODO: fix
        }
        let value = slice.withUnsafeBytes { pointer in
            return pointer.load(as: T.self)
        }
        _readingIndex += bytes
        return value.bigEndian
    }
    @inlinable
    mutating func fromBytes<T>(bytes: Int) throws -> T {
        let slice = [UInt8](data[_readingIndex..<_readingIndex + bytes])
        guard slice.count == MemoryLayout<T>.size else {
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "bruh;slice.count=\(slice.count);memoryLayout.size=\(MemoryLayout<T>.size)")) // TODO: fix
        }
        let value = slice.withUnsafeBytes { pointer in
            return pointer.load(as: T.self)
        }
        _readingIndex += bytes
        return value
    }
    @inlinable
    func to_bytes<T>(value: T, withCapacity capacity: Int) -> [UInt8] {
        var mutable_value = value
        let bytes = withUnsafePointer(to: &mutable_value) { pointer1 in
            return pointer1.withMemoryRebound(to: UInt8.self, capacity: capacity) { pointer2 in
                return Array(UnsafeBufferPointer(start: pointer2, count: capacity))
            }
        }
        return bytes
    }
}

// MARK: Read VarInt
extension GeneralPacketMojang {
    /// > Tip: Minecraft's VarInts are identical to [LEB128](https://en.wikipedia.org/wiki/LEB128) with the slight change of throwing a exception if it goes over a set amount of bytes.
    ///
    /// Minecraft's VarInts are not encoded using Protocol Buffers; it's just similar. If you try to use Protocol Buffers Varints with Minecraft's VarInts, you'll get incorrect results in some cases. The major differences:
    /// - Minecraft's VarInts are all signed, but do not use the ZigZag encoding. Protocol buffers have 3 types of Varints: `uint32` (normal encoding, unsigned), `sint32` (ZigZag encoding, signed), and `int32` (normal encoding, signed). Minecraft's are the `int32` variety. Because Minecraft uses the normal encoding instead of ZigZag encoding, negative values always use the maximum number of bytes.
    /// - Minecraft's VarInts are never longer than 5 bytes and its VarLongs will never be longer than 10 bytes, while Protocol Buffer Varints will always use 10 bytes when encoding negative numbers, even if it's an `int32`.
    @inlinable
    public mutating func readVarInt<T: VariableInteger>() throws -> T {
        var value:Int32 = 0
        var position:Int = 0
        var currentByte:UInt8 = 0
        while true {
            currentByte = data[_readingIndex]
            _readingIndex += 1
            value |= Int32(currentByte & GeneralPacketMojang.segmentBits) << position
            
            if currentByte & GeneralPacketMojang.continueBit == 0 {
                break
            }
            position += 7
            if position >= 32 {
                throw GeneralPacketError.varintTooBig
            }
        }
        return VariableIntegerJava(value: value) as! T
    }
}

// MARK: Read VarLong
extension GeneralPacketMojang {
    @inlinable
    public mutating func readVarLong<T: VariableLong>() throws -> T {
        var value:Int64 = 0
        var position:Int = 0
        var currentByte:UInt8 = 0
        while true {
            currentByte = data[_readingIndex]
            _readingIndex += 1
            value |= Int64(currentByte & GeneralPacketMojang.segmentBits) << position

            if currentByte & GeneralPacketMojang.continueBit == 0 {
                break
            }
            position += 7
            if position >= 32 {
                throw GeneralPacketError.varlongTooBig
            }
        }
        return VariableLongJava(value: value) as! T
    }
}

// MARK: Read byte
extension GeneralPacketMojang {
    @inlinable
    public mutating func readByte() throws -> Int8 {
        try fromBytesInteger(bytes: 1)
    }
    @inlinable
    public mutating func readUnsignedByte() throws -> UInt8 {
        try fromBytesInteger(bytes: 1)
    }
}

// MARK: Read short
extension GeneralPacketMojang {
    @inlinable
    public mutating func readShort() throws -> Int16 {
        try fromBytesInteger(bytes: 2)
    }
    @inlinable
    public mutating func readUnsignedShort() throws -> UInt16 {
        try fromBytesInteger(bytes: 2)
    }
}

// MARK: Read int
extension GeneralPacketMojang {
    @inlinable
    public mutating func readInt() throws -> Int32 {
        try fromBytesInteger(bytes: 4)
    }
}

// MARK: Read long
extension GeneralPacketMojang {
    @inlinable
    public mutating func readLong() throws -> Int64 {
        try fromBytesInteger(bytes: 8)
    }

    @inlinable
    public mutating func readUnsignedLong() throws -> UInt64 {
        try fromBytesInteger(bytes: 8)
    }
}

// MARK: Read Float
extension GeneralPacketMojang {
    private mutating func read_floating_point_little_endian<T: FloatingPoint>(bytes: Int) throws -> T {
        let slice = data[_readingIndex..<_readingIndex + bytes]
        let value = slice.withUnsafeBytes { pointer in
            return pointer.load(fromByteOffset: 0, as: T.self)
        }
        _readingIndex += bytes
        return value
    }

    @inlinable
    public mutating func readFloat() throws -> Float {
        return try fromBytes(bytes: 4)
    }
}

// MARK: Read Double
extension GeneralPacketMojang {
    @inlinable
    public mutating func readDouble() throws -> Double {
        return try fromBytes(bytes: 8)
    }
}

// MARK: Read String
extension GeneralPacketMojang {
    @inlinable
    public mutating func readString(size: Int) -> String {
        let string = String((0..<size).map({ i in data[_readingIndex + i].char }))
        _readingIndex += size
        return string
    }
    @inlinable
    public mutating func readString() throws -> String {
        let varint:VariableIntegerJava = try readVarInt()
        let size = varint.valueInt
        return readString(size: size)
    }
}

// MARK: Read Bool
extension GeneralPacketMojang {
    @inlinable
    public mutating func readBool() throws -> Bool {
        let byte = data[_readingIndex]
        _readingIndex += 1
        return byte == 1
    }
}

// MARK: Read Angle
extension GeneralPacketMojang {
    @inlinable
    public mutating func readAngle<T: Angle>() throws -> T {
        let byte = data[_readingIndex]
        _readingIndex += 1
        return AngleMojang(value: Int(byte)) as! T
    }
}

// MARK: Read enum
extension GeneralPacketMojang {
    @inlinable
    public mutating func readEnum<T: PacketEncodable & RawRepresentable<Int>>() throws -> T {
        let varint:VariableIntegerJava = try readVarInt()
        let integer = varint.valueInt
        guard let value = T.init(rawValue: integer) else {
            throw ServerPacketMojangErrors.VarIntEnum.doesntExist(type: T.self, id: integer)
        }
        return value
    }
}

// MARK: Read byte array
extension GeneralPacketMojang {
    @inlinable
    public mutating func readRemainingByteArray() throws -> [UInt8] {
        try readByteArray(bytes: data.count - _readingIndex)
    }
    @inlinable
    public mutating func readRemainingOptionalByteArray() throws -> [UInt8]? {
        let bytes = data.count - _readingIndex
        guard bytes > 0 else { return nil }
        return try readByteArray(bytes: bytes)
    }
    @inlinable
    public mutating func readByteArray(bytes: VariableIntegerJava) throws -> [UInt8] {
        try readByteArray(bytes: bytes.valueInt)
    }
    @inlinable
    public mutating func readByteArray(bytes: Int) throws -> [UInt8] {
        let slice = data[_readingIndex..<_readingIndex + bytes]
        _readingIndex += bytes
        return [UInt8](slice)
    }
}

// MARK: Read String array
extension GeneralPacketMojang {
    @inlinable
    public mutating func readStringArray(count: VariableIntegerJava) throws -> [String] {
        try readStringArray(count: count.valueInt)
    }
    @inlinable
    public mutating func readStringArray(count: Int) throws -> [String] {
        return try (0..<count).map({ _ in
            let varint:VariableIntegerJava = try readVarInt()
            return readString(size: varint.valueInt)
        })
    }
}

// MARK: Read map
extension GeneralPacketMojang {
    @inlinable
    public mutating func readMap<T>(count: VariableIntegerJava, transform: (inout Self) throws -> T) rethrows -> [T] {
        try readMap(count: count.valueInt, transform: transform)
    }
    @inlinable
    public mutating func readMap<T>(count: Int, transform: (inout Self) throws -> T) rethrows -> [T] {
        try (0..<count).map({ _ in try transform(&self) })
    }
}

// MARK: Read Packet
extension GeneralPacketMojang {
    @inlinable
    public mutating func readPacketArray<T: PacketDecodable>(count: VariableIntegerJava) throws -> [T] {
        try readPacketArray(count: count.valueInt)
    }
    @inlinable
    public mutating func readPacketArray<T: PacketDecodable>(count: Int) throws -> [T] {
        try (0..<count).map({ _ in try readPacket() })
    }
    @inlinable
    public mutating func readPacket<T: PacketDecodable>() throws -> T {
        let value = try T.decode(from: &self)
        _readingIndex += try value.packetBytes().count
        return value
    }
}

// MARK: Read namespace
extension GeneralPacketMojang {
    @inlinable
    public mutating func readIdentifier<T: Namespace>() throws -> T {
        let string = try readString()
        let values = string.split(separator: ".")
        guard values.count == 2 else {
            throw GeneralPacketError.namespaceValueLengthNotEqual
        }
        return NamespaceJava(identifier: values[0], value: values[1]) as! T
    }
}

// MARK: Read UUID
extension GeneralPacketMojang {
    @inlinable
    public mutating func readUUID() throws -> UUID {
        let l = try readUnsignedLong()
        let r = try readUnsignedLong()
        let left = withUnsafeBytes(of: l.bigEndian, Array.init)
        let right = withUnsafeBytes(of: r.bigEndian, Array.init)
        let test:uuid_t = (
            left[0], left[1], left[2], left[3], left[4], left[5], left[6], left[7],
            right[0], right[1], right[2], right[3], right[4], right[5], right[6], right[7]
        )
        return UUID(uuid: test)
    }
}

// MARK: Read Data
extension GeneralPacketMojang {
    @inlinable
    public mutating func readData(bytes: Int) throws -> Data {
        let array = try readByteArray(bytes: bytes)
        return Data(array)
    }
}

// MARK: Read Decodable
extension GeneralPacketMojang {
    @inlinable
    public mutating func readJSON<T: Decodable>() throws -> T {
        let varint:VariableIntegerJava = try readVarInt()
        let size = varint.valueInt
        let bytes = data[_readingIndex..<_readingIndex + size]
        let buffer = Data(bytes)
        let json = try JSONDecoder().decode(T.self, from: buffer)
        _readingIndex += size
        return json
    }
}