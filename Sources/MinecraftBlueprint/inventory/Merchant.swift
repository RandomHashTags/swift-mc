
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol Merchant: Sendable, ~Copyable {
    var trades: [any MerchantRecipe] { get }
    var traders: [UUID] { get }
    var isTrading: Bool { get }
}

extension Merchant {
    @inlinable
    public var isTrading: Bool {
        !traders.isEmpty
    }
}