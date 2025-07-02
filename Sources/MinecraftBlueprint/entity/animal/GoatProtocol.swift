
public protocol GoatProtocol: AnimalProtocol, ~Copyable {
    var hasLeftHorn: Bool { get }
    var hasRightHorn: Bool { get }
    var isScreaming: Bool { get }
}