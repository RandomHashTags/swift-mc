
public protocol MerchantRecipeProtocol: RecipeProtocol {
    associatedtype Ingredient: ItemStackProtocol

    var demand: Int { get }
    var maxTrades: Int { get }
    var tradesConducted: Int { get }
    var priceMultiplier: Float { get }
    var specialPrice: Int { get }
    var earnedExperience: Int { get }
    var hasRewardExperience: Bool { get }
    var rewardExperience: Int { get }
    var ingredients: [Ingredient] { get }
    var adjustedIngredients: [Ingredient] { get }

    func adjustTrade<T: ItemStackProtocol>(
        for item: T
    )
}

extension MerchantRecipeProtocol {
    @inlinable
    public var hasRewardExperience: Bool {
        rewardExperience > 0
    }
}