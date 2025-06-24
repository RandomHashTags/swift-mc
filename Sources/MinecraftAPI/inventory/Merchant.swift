import Foundation

public protocol Merchant {
    var trades: [any MerchantRecipe] { get }
    var traders: [UUID] { get }
    var isTrading: Bool { get }
}

public extension Merchant {
    var isTrading: Bool { !traders.isEmpty }
}