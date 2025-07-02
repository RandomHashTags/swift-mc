
public protocol ItemProtocol: EntityProtocol, ~Copyable {
    var itemStack: any ItemStackProtocol { get }
    var pickupDelay: UInt8 { get }
    
    func tickItem(_ server: any ServerProtocol)
}