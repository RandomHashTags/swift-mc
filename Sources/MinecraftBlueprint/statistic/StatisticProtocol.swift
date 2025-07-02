
public protocol StatisticProtocol: MinecraftIdentifiable, Nameable {
    associatedtype Category: StatisticCategoryProtocol

    var categories: [Category] { get }
    var value: ValueType { get }
}
