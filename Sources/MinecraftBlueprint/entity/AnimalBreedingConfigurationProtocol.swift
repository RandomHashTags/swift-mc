
public protocol AnimalBreedingConfigurationProtocol: MinecraftIdentifiable {
    associatedtype BreedItem: ItemStackProtocol

    var breedItem: BreedItem { get }
}