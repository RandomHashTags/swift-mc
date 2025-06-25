
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// Spawns one or more experience orbs.
    public struct SpawnExperienceOrb: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.spawnExperienceOrb
        
        public let entityID:VariableIntegerJava
        public let x:Double
        public let y:Double
        public let z:Double
        /// The amount of experience this orb will reward once collected.
        public let count:Int16

        @inlinable
        public init(
            entityID: VariableIntegerJava,
            x: Double,
            y: Double,
            z: Double,
            count: Int16
        ) {
            self.entityID = entityID
            self.x = x
            self.y = y
            self.z = z
            self.count = count
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [
                entityID,
                x,
                y,
                z,
                count
            ]
        }
    }
}

// MARK: Parse
extension ClientPacket.Mojang.Java.Play.SpawnExperienceOrb {
    @inlinable
    public static func parse(_ packet: any GeneralPacket) throws -> Self {
        let entityID:VariableIntegerJava = try packet.readVarInt()
        let x = try packet.readDouble()
        let y = try packet.readDouble()
        let z = try packet.readDouble()
        let count = try packet.readShort()
        return Self(entityID: entityID, x: x, y: y, z: z, count: count)
    }
}