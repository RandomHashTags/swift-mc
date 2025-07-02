
public protocol EnderCrystal: Entity, ~Copyable {
    var beamTarget: (any Location)? { get }
    var isShowingBottom: Bool { get }
}