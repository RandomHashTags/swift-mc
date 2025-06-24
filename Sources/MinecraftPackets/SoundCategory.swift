import MinecraftUtilities

public protocol SoundCategory: Codable, MinecraftIdentifiable {
    var packetID: Int { get }
}