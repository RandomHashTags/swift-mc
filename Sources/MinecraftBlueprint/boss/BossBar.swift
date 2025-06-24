public protocol BossBar {
    var title: String { get }
    var progress: Double { get }
    var color: Color { get }
    var flags: [any BarFlag] { get } // TODO: make Set
    var isVisible: Bool { get }
    var style: any BarStyle { get }
}
