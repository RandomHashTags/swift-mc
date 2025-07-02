
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol NBTAngerableProtocol: NBTEntityProtocol {
    var angerTime: Int { get }
    var angryAt: UUID? { get }
}