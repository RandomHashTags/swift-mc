#if canImport(FoundationEssentials)
import FoundationEssentials
#elseif canImport(Foundation)
import Foundation
#endif

public protocol NBTBreedable: NBTEntity {
    var age: Int { get }
    var forcedAge: Int { get }
    var inLove: Int { get }
    var loveCause: UUID { get }
}