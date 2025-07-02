
public protocol Structure: MinecraftIdentifiable {
    var categories: [any StructureCategory] { get } // TODO: make Set
}