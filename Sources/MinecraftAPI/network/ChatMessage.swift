
import Foundation

public protocol ChatMessage: MinecraftIdentifiable {
    var timestamp: Date { get }
    var sender: any CommandSender { get }
    var receiver: String? { get }
    var message: String { get }
}
