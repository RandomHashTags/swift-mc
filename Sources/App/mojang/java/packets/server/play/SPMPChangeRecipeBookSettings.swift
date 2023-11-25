//
//  SPMPChangeRecipeBookSettings.swift
//  
//
//  Created by Evan Anderson on 8/9/23.
//

import Foundation

public extension ServerPacket.Mojang.Java.Play {
    /// Replaces Recipe Book Data, type 1.
    struct ChangeRecipeBookSettings : ServerPacketMojangJavaPlayProtocol {
        public static let id:ServerPacket.Mojang.Java.Play = ServerPacket.Mojang.Java.Play.change_recipe_book_settings
        
        public static func parse(_ packet: GeneralPacketMojang) throws -> Self {
            let book:ChangeRecipeBookSettings.BookID = try packet.read_enum()
            let book_open:Bool = try packet.read_bool()
            let filter_active:Bool = try packet.read_bool()
            return Self(book: book, book_open: book_open, filter_active: filter_active)
        }
        
        public let book:ChangeRecipeBookSettings.BookID
        public let book_open:Bool
        public let filter_active:Bool
        
        public enum BookID : Int, Hashable, Codable, PacketEncodableMojangJava {
            case crafting
            case furnace
            case blast_furnace
            case smoker
        }
        
        public func encoded_values() throws -> [(any PacketEncodableMojangJava)?] {
            return [book, book_open, filter_active]
        }
    }
}
