
public protocol InventoryProtocol: Sendable, ~Copyable {
    var type: any InventoryTypeProtocol { get }
    var viewers: [any PlayerProtocol] { get }
        
    func contains(_ material: any MaterialProtocol) -> Bool
    func contains(_ item: any ItemStackProtocol) -> Bool
    
    func first(_ material: any MaterialProtocol) -> (any ItemStackProtocol)?
    func first(_ item: any ItemStackProtocol) -> (any ItemStackProtocol)?
    
    func getItem(slot: Int) -> (any ItemStackProtocol)?
    mutating func setItem(slot: Int, item: (any ItemStackProtocol)?)
    mutating func setItems(items: [(any ItemStackProtocol)?])
    mutating func addItem(item: any ItemStackProtocol)
}