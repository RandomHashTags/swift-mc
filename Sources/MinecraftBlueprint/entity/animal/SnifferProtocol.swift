
public protocol SnifferProtocol: AnimalProtocol, ~Copyable {
    associatedtype State: SnifferStateProtocol

    var canDig: Bool { get }
    var findDigLocation: Location? { get }
    var exploredLocations: [Location] { get } // TODO: make set
    var state: State { get }
}