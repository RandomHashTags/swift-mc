
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol NBTGossip: NBTTag {
    var value: Int { get }
    var target: UUID { get }
    var type: String { get }
}