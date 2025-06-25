#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol NBTTameable: NBTEntity {
    var owner: UUID? { get }
    var sitting: Bool { get }
}