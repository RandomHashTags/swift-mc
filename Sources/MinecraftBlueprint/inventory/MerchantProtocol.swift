
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol MerchantProtocol: Sendable, ~Copyable {
    var trades: [any MerchantRecipeProtocol] { get }
    var traders: [UUID] { get }
    var isTrading: Bool { get }
}

extension MerchantProtocol {
    @inlinable
    public var isTrading: Bool {
        !traders.isEmpty
    }
}