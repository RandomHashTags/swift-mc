
#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol Tameable: Animal, ~Copyable {
    var owner: UUID? { get }
    var isTamed: Bool { get }
}

extension Tameable {
    @inlinable
    public var isTamed: Bool {
        owner != nil
    }
}