
public protocol StatisticActive: Codable, MinecraftIdentifiable {
    var type: (any Statistic)? { get }
    var value: Float { get }
}
