public protocol EnderCrystal: Entity {
    var beamTarget: (any Location)? { get }
    var isShowingBottom: Bool { get }
}