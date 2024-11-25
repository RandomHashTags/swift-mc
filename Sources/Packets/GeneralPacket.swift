//
//  GeneralPacket.swift
//  
//
//  Created by Evan Anderson on 8/5/23.
//

import Foundation

public protocol GeneralPacket : Hashable {
    init(bytes: [UInt8]) throws

    func readByte() throws -> Int8
    func readUnsignedByte() throws -> UInt8

    func readShort() throws -> Int16
    func readUnsignedShort() throws -> UInt16

    func readInt() throws -> Int32
    func readLong() throws -> Int64
    func readUnsignedLong() throws -> UInt64

    func readFloat() throws -> Float
    func readDouble() throws -> Double

    func readString() throws -> String
    func readBool() throws -> Bool
    func readIdentifier<T>() throws -> T
    
    func readEnum<T : RawRepresentable>() throws -> T

    func readByteArray(bytes: Int) throws -> [UInt8]
    func readStringArray(count: Int) throws -> [String]

    func readMap<T>(count: Int, transform: () throws -> T) rethrows -> [T]

    func readUUID() throws -> UUID
}
