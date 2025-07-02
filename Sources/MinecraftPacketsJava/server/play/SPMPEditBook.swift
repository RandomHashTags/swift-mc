
import MinecraftPackets

extension ServerPacket.Mojang.Java.Play {
    public struct EditBook: ServerPacketMojangJavaPlayProtocol {
        public static let id = ServerPacket.Mojang.Java.Play.editBook
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let slot:VariableIntegerJava = try packet.readVarInt()
            let count:VariableIntegerJava = try packet.readVarInt()
            let entries = try packet.readStringArray(count: count.valueInt)
            let hasTitle = try packet.readBool()
            let title = hasTitle ? try packet.readString() : nil
            return Self(slot: slot, count: count, entries: entries, hasTitle: hasTitle, title: title)
        }
        
        /// The hotbar slot where the written book is located.
        public let slot:VariableIntegerJava
        /// Number of elements in the following array. Maximum array size is 200.
        public let count:VariableIntegerJava
        /// Text from each page. Maximum string length is 8192 chars.
        public let entries:[String]
        /// If true, the next field is present. true if book is being signed, false if book is being edited.
        public let hasTitle:Bool
        /// Title of book.
        public let title:String?
        
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[any PacketEncodableMojangJava] = [slot, count]
            array.append(contentsOf: entries)
            array.append(hasTitle)
            if hasTitle {
                let title = try unwrapOptional(title, key: \Self.title, precondition: "has_title == true")
                array.append(title)
            }
            return array
        }
    }
}
