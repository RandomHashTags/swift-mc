
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    /// Sent when 'Done' is pressed on the Jigsaw Block interface.
    public struct ProgramJigsawBlock: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.programJigsawBlock

        @inlinable
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let location:PositionPacketMojang = try packet.readPacket()
            let name:NamespaceJava = try packet.readIdentifier()
            let target:NamespaceJava = try packet.readIdentifier()
            let pool:NamespaceJava = try packet.readIdentifier()
            let finalState = try packet.readString()
            let jointType = try packet.readString()
            return Self(location: location, name: name, target: target, pool: pool, finalState: finalState, jointType: jointType)
        }
        
        /// Block entity location
        public let location:PositionPacketMojang

        public let name:NamespaceJava

        public let target:NamespaceJava
    
        public let pool:NamespaceJava

        /// "Turns into" on the GUI, `final_state` in NBT.
        public let finalState:String

        /// `rollable` if the attached piece can be rotated, else `aligned`.
        public let jointType:String

        public init(
            location: PositionPacketMojang,
            name: NamespaceJava,
            target: NamespaceJava,
            pool: NamespaceJava,
            finalState: String,
            jointType: String
        ) {
            self.location = location
            self.name = name
            self.target = target
            self.pool = pool
            self.finalState = finalState
            self.jointType = jointType
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [location, name, target, pool, finalState, jointType]
        }
    }
}
