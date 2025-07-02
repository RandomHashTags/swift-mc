
public protocol EnchantmentTargetProtocol: Sendable, ~Copyable {
    var materialCategoryIDs: Set<String> { get }
    var materialIDs: Set<String> { get }
}