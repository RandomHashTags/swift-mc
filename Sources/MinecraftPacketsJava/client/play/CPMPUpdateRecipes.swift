
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    public struct UpdateRecipes: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.updateRecipes
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let count:VariableIntegerJava = try packet.readVarInt()
            let recipes:[UpdateRecipes.UpdateRecipe] = try packet.readMap(count: count.valueInt) {
                let identifier:NamespaceJava = try $0.readIdentifier()
                let recipeID:NamespaceJava = try $0.readIdentifier()
                let data:Data = Data() // TODO: fix
                return .init(identifier: identifier, recipeID: recipeID, data: data)
            }
            return Self(count: count, recipes: recipes)
        }
        
        /// Number of elements in `recipes`.
        public let count:VariableIntegerJava

        public let recipes:[UpdateRecipes.UpdateRecipe]
        
        public struct UpdateRecipe: Codable, PacketEncodableMojangJava {
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
