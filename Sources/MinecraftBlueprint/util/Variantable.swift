
/// Indicates there are different variants of this type.
public protocol Variantable: MinecraftIdentifiable {
    associatedtype Variant: MinecraftIdentifiable
}