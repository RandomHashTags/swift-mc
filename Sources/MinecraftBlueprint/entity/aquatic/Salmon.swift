
public protocol Salmon: Fish, ~Copyable {
    var variant: any SalmonVariant { get }
}