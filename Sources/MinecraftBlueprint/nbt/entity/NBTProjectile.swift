import Foundation

public protocol NBTProjectile: NBTTag {
    var hasBeenShot: Bool { get }
    var leftOwner: Bool { get }
    var owner: UUID? { get }
}