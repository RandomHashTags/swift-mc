
public protocol SnifferProtocol: AnimalProtocol, ~Copyable {
    var canDig: Bool { get }
    var findDigLocation: (any LocationProtocol)? { get }
    var exploredLocations: [any LocationProtocol] { get } // TODO: make set
    var state: any SnifferStateProtocol { get }
}