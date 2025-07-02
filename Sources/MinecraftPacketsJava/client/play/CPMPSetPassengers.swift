
import MinecraftPackets

extension ClientPacket.Mojang.Java.Play {
    public struct SetPassengers: ClientPacket.Mojang.Java.PlayProtocol {
        public static let id = ClientPacket.Mojang.Java.Play.setPassengers
        
        public static func parse(_ packet: inout GeneralPacketMojang) throws -> Self {
            let entityID:VariableIntegerJava = try packet.readVarInt()
            let passengerCount:VariableIntegerJava = try packet.readVarInt()
            let passengers:[VariableIntegerJava] = try packet.readPacketArray(count: passengerCount.valueInt)
            return Self(entityID: entityID, passengerCount: passengerCount, passengers: passengers)
        }
        
        public let entityID:VariableIntegerJava
        public let passengerCount:VariableIntegerJava
        public let passengers:[VariableIntegerJava]

        @inlinable
        public func encodedValues() throws -> [(any PacketEncodableMojangJava)?] {
            var array:[any PacketEncodableMojangJava] = [entityID, passengerCount]
            array.append(contentsOf: passengers)
            return array
        }
    }
}
