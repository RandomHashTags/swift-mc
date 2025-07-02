
public protocol SalmonProtocol: FishProtocol, ~Copyable {
    associatedtype Variant: SalmonVariantProtocol
    var variant: Variant { get }
}