#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol NBTAngerable: NBTEntity {
    var angerTime: Int { get }
    var angryAt: UUID? { get }
}