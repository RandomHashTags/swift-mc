//
//  SPMPEditBook.swift
//  
//
//  Created by Evan Anderson on 8/9/23.
//

import Packets

extension ServerPacket.Mojang.Java.Play {
    struct EditBook : ServerPacketMojangJavaPlayProtocol {
        public static let id:ServerPacket.Mojang.Java.Play = ServerPacket.Mojang.Java.Play.edit_book
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let slot:VariableIntegerJava = try packet.readVarInt()
            let count:VariableIntegerJava = try packet.readVarInt()
            let entries:[String] = try packet.readStringArray(count: count)
            let has_title:Bool = try packet.readBool()
            let title:String? = has_title ? try packet.readString() : nil
            return Self(slot: slot, count: count, entries: entries, has_title: has_title, title: title)
        }
        
        /// The hotbar slot where the written book is located.
        public let slot:VariableIntegerJava
        /// Number of elements in the following array. Maximum array size is 200.
        public let count:VariableIntegerJava
        /// Text from each page. Maximum string length is 8192 chars.
        public let entries:[String]
        /// If true, the next field is present. true if book is being signed, false if book is being edited.
        public let has_title:Bool
        /// Title of book.
        public let title:String?
        
        public func encoded_values() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[any PacketEncodableMojangJava] = [slot, count]
            array.append(contentsOf: entries)
            array.append(has_title)
            if has_title {
                let title:String = try unwrap_optional(title, key_path: \Self.title, precondition: "has_title == true")
                array.append(title)
            }
            return array
        }
    }
}
