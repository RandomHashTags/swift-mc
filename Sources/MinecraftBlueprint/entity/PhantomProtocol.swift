
public protocol PhantomProtocol: Flying, HostileProtocol, ~Copyable {
    var size: Int { get }
}