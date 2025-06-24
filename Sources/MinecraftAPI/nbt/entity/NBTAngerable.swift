import Foundation

public protocol NBTAngerable: NBTEntity {
    var angerTime: Int { get }
    var angryAt: UUID? { get }
}