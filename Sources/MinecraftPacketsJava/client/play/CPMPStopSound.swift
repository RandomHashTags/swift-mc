
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    public struct StopSound: ClientPacket.Mojang.Java.PlayProtocol { // TODO: fix
        public static let id = ClientPacket.Mojang.Java.Play.stopSound
        
        /// Controls which fields are present.
        public let flags:Int8
        /// Only if flags is 3 or 1 (bit mask 0x1). See below. If not present, then sounds from all sources are cleared.
        public let source:VariableIntegerJava?
        /// Only if flags is 2 or 3 (bit mask 0x2). A sound effect name, see [Custom Sound Effect](https://wiki.vg/Protocol#Custom_Sound_Effect ). If not present, then all sounds are cleared.
        public let sound:NamespaceJava?

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[(any PacketEncodableMojangJava)?] = [flags]
            switch flags {
            case 1:
                array.append(source)
            case 2:
                array.append(sound)
            case 3:
                array.append(source)
                array.append(sound)
            default:
                break
            }
            return array
        }
    }
}
