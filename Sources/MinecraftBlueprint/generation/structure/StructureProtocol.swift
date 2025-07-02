
public protocol StructureProtocol: MinecraftIdentifiable {
    var categories: [any StructureCategoryProtocol] { get } // TODO: make Set
}