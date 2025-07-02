
public protocol StatisticActiveProtocol: Codable, MinecraftIdentifiable {
    associatedtype Statistic: StatisticProtocol

    var type: Statistic? { get }
    var value: Float { get }
}
