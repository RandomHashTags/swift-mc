
public protocol BossBarProtocol: Sendable, ~Copyable {
    var title: String { get }
    var progress: Double { get }
    var color: Color { get }
    var flags: [any BarFlagProtocol] { get } // TODO: make Set
    var isVisible: Bool { get }
    var style: any BarStyleProtocol { get }
}