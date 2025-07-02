
public protocol EnderCrystalProtocol: EntityProtocol, ~Copyable {
    var beamTarget: (any LocationProtocol)? { get }
    var isShowingBottom: Bool { get }
}