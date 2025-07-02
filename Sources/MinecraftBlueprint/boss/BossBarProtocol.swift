
public protocol BossBarProtocol: Sendable, ~Copyable {
    associatedtype BarFlag: BarFlagProtocol
    associatedtype BarStyle: BarStyleProtocol

    var title: String { get }
    var progress: Double { get }
    var color: Color { get }
    var flags: [BarFlag] { get } // TODO: make Set
    var isVisible: Bool { get }
    var style: BarStyle { get }
}