public protocol BiomeConfiguration: MinecraftIdentifiable {
    var temperature: Float { get }
    var temperatureStartingY: Int { get }
    var temperatureEndingY: Int { get }
    var temperatureDropRate: Float { get }
    
    var downfall: Float { get }
}
