import Foundation

public protocol NBTGossip: NBTTag {
    var value: Int { get }
    var target: UUID { get }
    var type: String { get }
}