#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    public struct BossBar: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.bossBar

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let uuid = try packet.readUUID()
            let action:BossBar.Action = try packet.readEnum()
            var title:ChatPacketMojang? = nil
            var health:Float? = nil
            var color:Color? = nil
            var division:Division? = nil
            var flags:UInt8? = nil
            switch action {
            case .add:
                title = nil // TODO: fix
                health = try packet.readFloat()
                color = try packet.readEnum()
                division = try packet.readEnum()
                flags = try packet.readUnsignedByte()
            case .remove:
                break
            case .update_health:
                health = try packet.readFloat()
            case .update_title:
                title = nil // TODO: fix
            case .update_style:
                color = try packet.readEnum()
                division = try packet.readEnum()
            case .update_flags:
                flags = try packet.readUnsignedByte()
            }
            return Self(uuid: uuid, action: action, title: title, health: health, color: color, division: division, flags: flags)
        }
        
        /// Unique ID for this bar.
        public let uuid:UUID

        /// Determines the layout of the remaining packet.
        public let action:Action
        
        // add, update_title
        public let title:ChatPacketMojang?

        // add, update_health
        /// From 0 to 1. Values greater than 1 do not crash a Notchian client, and start rendering part of a second health bar at around 1.5.
        public let health:Float?

        // add, update_style
        /// Color ID.
        public let color:Color?

        // add
        /// Type of division.
        public let division:Division?

        // add, update_flags
        /// Bit mask. 0x1: should darken sky, 0x2: is dragon bar (used to play end music), 0x04: create fog (previously was also controlled by 0x02).
        public let flags:UInt8?

        public init(
            uuid: UUID,
            action: Action,
            title: ChatPacketMojang?,
            health: Float?,
            color: Color?,
            division: Division?,
            flags: UInt8?
        ) {
            self.uuid = uuid
            self.action = action
            self.title = title
            self.health = health
            self.color = color
            self.division = division
            self.flags = flags
        }
        
        public enum Action: Int, Codable, PacketEncodableMojangJava {
            case add = 0
            case remove
            case update_health
            case update_title
            case update_style
            case update_flags
        }
        public enum Color: Int, Codable, PacketEncodableMojangJava {
            case pink = 0
            case blue
            case red
            case green
            case yellow
            case purple
            case white
        }
        public enum Division: Int, Codable, PacketEncodableMojangJava {
            case no_division = 0
            case six_notches
            case ten_notches
            case twelve_notches
            case twenty_notches
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[(any PacketEncodableMojangJava)?] = [uuid, action]
            let secondary:[(any PacketEncodableMojangJava)?]
            switch action {
            case .add:
                secondary = [title, health, color, division, flags]
            case .remove:
                secondary = []
            case .update_health:
                secondary = [health]
            case .update_title:
                secondary = [title]
            case .update_style:
                secondary = [color, division]
            case .update_flags:
                secondary = [flags]
            }
            array.append(contentsOf: secondary)
            return array
        }
    }
}
