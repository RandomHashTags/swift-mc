
public protocol SalmonProtocol: FishProtocol, ~Copyable {
    var variant: any SalmonVariantProtocol { get }
}