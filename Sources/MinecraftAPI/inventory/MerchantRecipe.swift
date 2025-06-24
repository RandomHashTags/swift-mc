//
//  MerchantRecipe.swift
//  
//
//  Created by Evan Anderson on 11/27/24.
//

public protocol MerchantRecipe: Recipe {
    var demand: Int { get }
    var maxTrades: Int { get }
    var tradesConducted: Int { get }
    var priceMultiplier: Float { get }
    var specialPrice: Int { get }
    var earnedExperience: Int { get }
    var hasRewardExperience: Bool { get }
    var rewardExperience: Int { get }
    var ingredients: [any ItemStack] { get }
    var adjustedIngredients: [any ItemStack] { get }

    func adjustTrade(for item: any ItemStack)
}

public extension MerchantRecipe {
    var hasRewardExperience: Bool { rewardExperience > 0 }
}