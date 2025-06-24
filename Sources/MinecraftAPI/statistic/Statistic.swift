public protocol Statistic: MinecraftIdentifiable, Nameable {
    var categories: [any StatisticCategory] { get }
    var value: ValueType { get }
}
