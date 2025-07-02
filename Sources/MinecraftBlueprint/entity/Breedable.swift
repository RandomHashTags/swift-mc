
public protocol Breedable: Ageable, ~Copyable {
    var canBreed: Bool { get }
    var isAgeLocked: Bool { get }
}