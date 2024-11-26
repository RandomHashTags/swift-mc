//
//  CPMPUpdateRecipes.swift
//
//
//  Created by Evan Anderson on 8/2/23.
//

import Foundation
import MinecraftPackets

public extension ClientPacket.Mojang.Java.Play {
    struct UpdateRecipes : ClientPacket.Mojang.Java.PlayProtocol {
        public static let id:ClientPacket.Mojang.Java.Play = ClientPacket.Mojang.Java.Play.updateRecipes
        
        public static func parse(_ packet: any GeneralPacket) throws -> Self {
            let count:VariableIntegerJava = try packet.readVarInt()
            let recipes:[UpdateRecipes.UpdateRecipe] = try packet.readMap(count: count.value_int) {
                let identifier:NamespaceJava = try packet.readIdentifier()
                let recipeID:NamespaceJava = try packet.readIdentifier()
                let data:Data = Data() // TODO: fix
                return UpdateRecipes.UpdateRecipe(identifier: identifier, recipeID: recipeID, data: data)
            }
            return Self(count: count, recipes: recipes)
        }
        
        /// Number of elements in `recipes`.
        public let count:VariableIntegerJava
        public let recipes:[UpdateRecipes.UpdateRecipe]
        
        public struct UpdateRecipe : Codable, PacketEncodableMojangJava {
            public let identifier:NamespaceJava
            public let recipeID:NamespaceJava
            /// Additional data for the recipe.
            public let data:Data
            
            public func packetBytes() throws -> [UInt8] {
                var array:[UInt8] = try identifier.packetBytes()
                array.append(contentsOf: try recipeID.packetBytes())
                array.append(contentsOf: try data.packetBytes())
                return array
            }
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[(any PacketEncodableMojangJava)?] = [count]
            array.append(contentsOf: recipes)
            return array
        }
    }
}
