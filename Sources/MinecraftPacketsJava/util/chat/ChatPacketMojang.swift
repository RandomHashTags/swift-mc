#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

import MinecraftPackets

public struct ChatPacketMojang: ChatPacket, PacketMojangJava, PacketEncodableMojangJava, PacketDecodableMojangJava {
    public typealias GameplayID = ClientPacket.Mojang.Java.Status

    // TODO: fix
    public static let id = ClientPacket.Mojang.Java.Status.pingResponse
    public static let packetGameplayID = ClientPacket.Mojang.Java.Status.self

    @inlinable
    public var category: any PacketCategory {
        PacketCategoryMojangJava.middleware
    }
    
    public let text:String
    
    /// Translates text into the current language. If the JSON contains a `translate` key, then the component is a translation component.
    ///
    /// Translation supports `%s`, `%n$s` (where `n` is an index) and `%%` format tokens. `%%` is just an escaped percent symbol. `%s` marks text to replace using content from the optional `with` tag. `with` is an array of components. `%n$s` acts like `%s` but instead will use the text component in `with` that is at the index of n.
    ///
    /// > Note: When the key is not known by a language file, it will result in the translation key being the value of the text. For Example, `soundCategory.hostile` exists and will result in `"Hostile Creatures"` whereas `soundCategory.angry` (Which does not exist) will result in `"soundCategory.angry"`.
    ///
    /// As a special case, if the translation key is `chat.type.text`, it will be changed to `chat.type.text.narrate` when passed to narrator (although it will remain as `chat.type.text` in chat).
    ///
    /// **Example**:
    /// ```json
    /// {"translate":"chat.type.text","with":[{"text":"Herobrine","clickEvent":{"action":"suggest_command","value":"/msg Herobrine "},"hoverEvent":{"action":"show_entity","value":"{id:f84c6a79-0a4e-45e0-879b-cd49ebd4c4e2,name:Herobrine}"},"insertion":"Herobrine"},{"text":"I don't exist"}]}
    /// ```
    /// The `chat.type.text` translation key becomes `<%s> %s`, which is then filled in with the player's name and the actual message.
    /// > Note: The player's name has a click event (which inserts text to message the player), a hover event (which shows the entity ID; also note that `type` is missing), and an insertion (for the player's name).
    public let translate:String?
    public let with:[ChatPacketMojang]?
    
    public let score:Score?
    
    public let bold:Bool?
    public let italic:Bool?
    public let underlined:Bool?
    public let strikethrough:Bool?
    public let obfuscated:Bool?
    public let font:String?
    public let color:String?
    public let insertion:String?
    public let clickEvent:ClickEvent?
    public let hoverEvent:HoverEvent?
    
    public let extra:[ChatPacketMojang]?

    @inlinable
    public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] { // TODO: fix
        return []
    }
}

// MARK: Decode
extension ChatPacketMojang {
    @inlinable
    public static func decode<T: GeneralPacket>(from packet: inout T) throws -> ChatPacketMojang {
        throw GeneralPacketError.notImplemented(packetType: Self.self)
    }
}

// MARK: Score
extension ChatPacketMojang {
    /// Displays a score. If the JSON contains a score key, then the component is a score component.
    ///
    /// The score JSON object contains data about the objective.
    ///
    /// When being sent to the client, it must contain `name`, `objective`, and `value` keys. `name` is a player username or entity UUID (if it is a player, it is a username); `objective` is the name of the objective; `value` is the resolved value of that objective.
    ///
    /// When being sent to the server, `value` is not used. `name` can be an entity selector (that selects one entity), or alternatively `*` which matches the sending player.
    public struct Score: Codable, Hashable, Sendable {
        public let name:String
        public let objective:String
        public let value:Float

        public init(
            name: String,
            objective: String,
            value: Float
        ) {
            self.name = name
            self.objective = objective
            self.value = value
        }
    }
}

// MARK: Click Event
extension ChatPacketMojang {
    /// Defines an event that occurs when this component is clicked. Contains an `action` key and a `value` key. `value` is internally handled as a String, although it can be any type of JSON primitive.
    public struct ClickEvent: Codable, Hashable, Sendable {
        public let action:ClickEventAction
        public let value:String
    }
    public enum ClickEventAction: String, Codable, Hashable, Sendable {
        /// Opens the given URL in the default web browser. Ignored if the player has opted to disable links in chat; may open a GUI prompting the user if the setting for that is enabled. The link's protocol must be set and must be `http` or `https`, for security reasons.
        case open_url
        
        /// **Cannot be used within JSON chat**. Opens a link to any protocol, but cannot be used in JSON chat for security reasons. Only exists to internally implement links for screenshots.
        @available(*, deprecated, message: "No longer supported.")
        case open_file
        
        /// Runs the given command. Not required to be a command - clicking this only causes the client to send the given content as a chat message, so if not prefixed with `/`, they will say the given text instead. If used in a book GUI, the GUI is closed after clicking.
        case run_command
        
        /// Cannot be used within JSON chat. Only usable in 1.8 and below; twitch support was removed in 1.9. Additionally, this is only used internally by the client. On click, opens a twitch user info GUI screen. Value should be the twitch user name.
        @available(*, deprecated, message: "No longer supported.")
        case twitch_user_info
        
        /// Only usable for messages in chat. Replaces the content of the chat box with the given text - usually a command, but it is not required to be a command (commands should be prefixed with `/`).
        case suggested_command
        
        /// Only usable within written books. Changes the page of the book to the given page, starting at 1. For instance, `"value":1` switches the book to the first page. If the page is less than one or beyond the number of pages in the book, the event is ignored.
        case change_page
        
        /// Copies the given text to the client's clipboard when clicked.
        case copy_to_clipboard
    }
}

// MARK: Hover Event
extension ChatPacketMojang {
    /// Defines an event that occurs when this component hovered over. Contains an `action` key and a `contents` key; `action` is a String and `contents` is a JSON object. However, since text components can be serialized as primitives as well as arrays and objects, this can directly be a String.
    public struct HoverEvent: Codable, Hashable, Sendable {
        let action:HoverEventAction
        let value:Data?
        let contents:Data?
        
        var contentsString: String? {
            guard let data:Data = value ?? contents else { return nil }
            return String(data: data, encoding: .utf8)
        }
        func contentsJSON<T: Decodable>() -> T? {
            guard let data:Data = value ?? contents else { return nil }
            return try? JSONDecoder().decode(T.self, from: data)
        }
    }
    public enum HoverEventAction: String, Codable, Hashable, Sendable {
        /// The text to display. Can either be a string directly (`"contents":"la"`) or a full component (`"contents":{"text":"la","color":"red"}`).
        /// > Note: Versions prior to 1.16 use the `value` field instead of `contents` but value is still supported.
        case show_text
        
        /// The NBT of the item to display expressed as a JSON Object containing the keys `id`, `count` and `tag`. `id` is a resource location to the item for (`minecraft:stone`). `count` is the number of items in the item stack. `tag` is a string of the items nbt information in the form of sNBT (as would be used in `/give`).
        ///
        /// **Example**:
        /// ```json
        /// {"contents":{"id":"minecraft:lime_wool","count": 2,"tag":"{display:{Name:Testing}}"}}
        /// ```
        /// Invalid Items are replaced by `minecraft:air`.
        ///
        /// > Note: In versions before 1.16 this is a String and not a JSON object - it should either be set in a String directly (`"value":"{id:35,Damage:5,Count:2,tag:{display:{Name:Testing}}}"`) or as text of a component (`"value":{"text":"{id:35,Damage:5,Count:2,tag:{display:{Name:Testing}}}"`}). If the item is invalid, "Invalid Item!" will be drawn in red instead.
        case show_item
        
        /// A JSON-NBT String describing the entity. Contains 3 values: `id`, the entity's UUID (with dashes); `type` (optional), which contains the resource location for the entity's type (eg `minecraft:zombie`); and `name`, which contains the entity's custom name (if present).
        /// > Note: This is a String and not a JSON object. It should be set in a String directly (`"value":"{id:7e4a61cc-83fa-4441-a299-bf69786e610a,type:minecraft:zombie,name:Zombie}"`) or as the content of a component. If the entity is invalid, "Invalid Entity!" will be displayed.
        ///
        /// > Note: The client does _not_ need to have the given entity loaded.
        case show_entity
        
        /// Since 1.12, this no longer exists; advancements instead simply use show\_text. The ID of an achievement or statistic to display. Example: `"contents":{"translate":"achievement.openInventory"}` (1.16+) and `"value":"achievement.openInventory"` (prior to 1.16).
        @available(*, deprecated, message: "No longer supported.")
        case show_achievement
    }
}
