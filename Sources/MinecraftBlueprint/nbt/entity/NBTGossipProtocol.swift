
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol NBTGossipProtocol: NBTTagProtocol {
    var value: Int { get }
    var target: UUID { get }
    var type: String { get }
}