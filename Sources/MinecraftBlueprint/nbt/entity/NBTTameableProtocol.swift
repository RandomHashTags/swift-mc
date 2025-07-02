
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol NBTTameableProtocol: NBTEntityProtocol {
    var owner: UUID? { get }
    var sitting: Bool { get }
}