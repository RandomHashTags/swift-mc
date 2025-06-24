import Foundation

public protocol NBTTameable: NBTEntity {
    var owner: UUID? { get }
    var sitting: Bool { get }
}