
public protocol StatisticActiveProtocol: Codable, MinecraftIdentifiable {
    var type: (any StatisticProtocol)? { get }
    var value: Float { get }
}
