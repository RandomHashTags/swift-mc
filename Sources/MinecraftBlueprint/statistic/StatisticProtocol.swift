
public protocol StatisticProtocol: MinecraftIdentifiable, Nameable {
    var categories: [any StatisticCategoryProtocol] { get }
    var value: ValueType { get }
}
