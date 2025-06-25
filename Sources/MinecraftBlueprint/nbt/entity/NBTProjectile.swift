#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol NBTProjectile: NBTTag {
    var hasBeenShot: Bool { get }
    var leftOwner: Bool { get }
    var owner: UUID? { get }
}