public protocol Breedable: Ageable {
    var canBreed: Bool { get }
    var isAgeLocked: Bool { get }
}