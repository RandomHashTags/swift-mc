import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// Changes the difficulty setting in the client's option menu.
    public struct ChangeDifficulty: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.changeDifficulty
        
        public let difficulty:ChangeDifficulty.Difficulty
        public let difficultyLocked:Bool

        public init(
            difficulty: ChangeDifficulty.Difficulty,
            difficultyLocked: Bool
        ) {
            self.difficulty = difficulty
            self.difficultyLocked = difficultyLocked
        }
        
        public enum Difficulty: UInt8, Codable, PacketEncodableMojangJava {
            case peaceful = 0
            case easy
            case normal
            case hard
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [difficulty, difficultyLocked]
        }
    }
}
