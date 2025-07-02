
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol EntityAccessProtocol: Sendable, ~Copyable {
    var id: UInt64 { get }
    var uuid: UUID { get }
    var shouldBeSaved: Bool { get }
    var isAlwaysTicking: Bool { get }
}