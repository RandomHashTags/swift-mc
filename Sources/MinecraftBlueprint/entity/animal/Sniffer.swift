
public protocol Sniffer: Animal, ~Copyable {
    var canDig: Bool { get }
    var findDigLocation: (any Location)? { get }
    var exploredLocations: [any Location] { get } // TODO: make set
    var state: any SnifferState { get }
}