
public protocol StructureProtocol: MinecraftIdentifiable {
    associatedtype Category: StructureCategoryProtocol

    var categories: [Category] { get } // TODO: make Set
}