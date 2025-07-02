
public protocol Item: Entity, ~Copyable {
    var itemStack: any ItemStack { get }
    var pickupDelay: UInt8 { get }
    
    func tickItem(_ server: any Server)
}