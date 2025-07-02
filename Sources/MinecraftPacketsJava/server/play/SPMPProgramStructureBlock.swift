
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// !
    ///
    /// The Notchian client uses `update data` to indicate no special action should be taken (i.e. the done button).
    public struct ProgramStructureBlock: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.programStructureBlock
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let location:PositionPacketMojang = try packet.readPacket()
            let action:ProgramStructureBlock.Action = try packet.readEnum()
            let mode:ProgramStructureBlock.Mode = try packet.readEnum()
            let name = try packet.readString()
            let offset_x = try packet.readByte()
            let offset_y = try packet.readByte()
            let offset_z = try packet.readByte()
            let size_x = try packet.readByte()
            let size_y = try packet.readByte()
            let size_z = try packet.readByte()
            let mirror:ProgramStructureBlock.Mirror = try packet.readEnum()
            let rotation:ProgramStructureBlock.Rotation = try packet.readEnum()
            let metadata = try packet.readString()
            let integrity = try packet.readFloat()
            let seed:VariableLongJava = try packet.readVarLong()
            let flags = try packet.readByte()
            return Self(location: location, action: action, mode: mode, name: name, offsetX: offset_x, offsetY: offset_y, offsetZ: offset_z, sizeX: size_x, sizeY: size_y, sizeZ: size_z, mirror: mirror, rotation: rotation, metadata: metadata, integrity: integrity, seed: seed, flags: flags)
        }
        
        /// Block entity location.
        public let location:PositionPacketMojang

        /// An additional action to perform beyond simply saving the given data.
        public let action:Action

        public let mode:Mode

        public let name:String
    
        /// Between -48 and 48.
        public let offsetX:Int8

        /// Between -48 and 48.
        public let offsetY:Int8

        /// Between -48 and 48.
        public let offsetZ:Int8

        /// Between 0 and 48.
        public let sizeX:Int8

        /// Between 0 and 48.
        public let sizeY:Int8

        /// Between 0 and 48.
        public let sizeZ:Int8

        public let mirror:Mirror

        public let rotation:Rotation

        public let metadata:String

        /// Between 0 and 1.
        public let integrity:Float

        public let seed:VariableLongJava

        /// 0x01: Ignore entities; 0x02: Show air; 0x04: Show bounding box.
        public let flags:Int8
        
        public enum Action: Int, Codable, PacketEncodableMojangJava {
            case updateData
            case save
            case load
            case detectSize
        }
        public enum Mode: Int, Codable, PacketEncodableMojangJava {
            case save
            case load
            case corner
            case data
        }
        
        public enum Mirror: Int, Codable, PacketEncodableMojangJava {
            case none
            case leftRight
            case frontBack
        }
        public enum Rotation: Int, Codable, PacketEncodableMojangJava {
            case none
            case clockwise90
            case clockwise180
            case counterclockwise90
        }
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [
                location,
                action,
                mode,
                name,
                offsetX,
                offsetY,
                offsetZ,
                sizeX,
                sizeY,
                sizeZ,
                mirror,
                rotation,
                metadata,
                integrity,
                seed,
                flags
            ]
        }
    }
}
