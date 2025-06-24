import Foundation

public protocol NBTBreedable: NBTEntity {
    var age: Int { get }
    var forcedAge: Int { get }
    var inLove: Int { get }
    var loveCause: UUID { get }
}