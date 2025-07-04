import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    /// This packet is sent from the server to the client when a window is forcibly closed, such as when a chest is destroyed while it's open. The notchian client disregards the provided window ID and closes any active window.
    public struct CloseContainer: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.closeContainer
        
        /// This is the ID of the window that was closed. 0 for inventory.
        public let windowID:UInt8

        public init(
            windowID: UInt8
        ) {
            self.windowID = windowID
        }

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            return [windowID]
        }
    }
}
