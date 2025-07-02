
public protocol MerchantRecipeProtocol: RecipeProtocol {
    var demand: Int { get }
    var maxTrades: Int { get }
    var tradesConducted: Int { get }
    var priceMultiplier: Float { get }
    var specialPrice: Int { get }
    var earnedExperience: Int { get }
    var hasRewardExperience: Bool { get }
    var rewardExperience: Int { get }
    var ingredients: [any ItemStackProtocol] { get }
    var adjustedIngredients: [any ItemStackProtocol] { get }

    func adjustTrade(for item: any ItemStackProtocol)
}

extension MerchantRecipeProtocol {
    @inlinable
    public var hasRewardExperience: Bool {
        rewardExperience > 0
    }
}