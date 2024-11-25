//
//  ClientMojangJava.swift
//
//
//  Created by Evan Anderson on 11/6/23.
//

import Logging
import Packets
import PacketsJava
import Socket
import SwiftASN1


final class ClientMojangJava : MinecraftClientHandler {
    public static let platform:PacketPlatform = PacketPlatform.mojang_java
    
    public static func == (lhs: ClientMojangJava, rhs: ClientMojangJava) -> Bool {
        return lhs.socket == rhs.socket && lhs.state == rhs.state
    }
    
    public typealias ProtocolVersion = MinecraftProtocolVersion.Java
    public typealias PlayerType = PlayerJava
    
    
    internal let socket:Socket
    
    public private(set) var state:ServerMojangStatus = ServerMojangStatus.handshaking_received_packet
    public private(set) var protocolVersion:ProtocolVersion = ProtocolVersion.unknown
    public private(set) var information:ServerPacket.Mojang.Java.Configuration.ClientInformation?
    private var player_builder:PlayerBuilder!
    public private(set) var player:PlayerType?
    private var connection_task:Task<Void, Never>!
    
    init(socket: Socket) {
        self.socket = socket
        connection_task = Task {
            while socket.isActive {
                do {
                    try processPacket()
                } catch {
                    ServerMojang.instance.logger.critical("ClientMojangJava;processPacket;error=\(error)")
                }
            }
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(socket)
        hasher.combine(state)
    }
    
    public func processPacket() throws {
        switch state {
        case .handshaking_received_packet:
            try parse_handshake()
            break
        case .status:
            try parse_status()
            break
        case .login:
            try parse_login()
            break
        case .configuration:
            try parse_configuration()
            break
        case .play:
            try parse_play()
            break
        default:
            ServerMojang.instance.logger.critical("ClientMojangJava;proccess_packet;unhandled state=\(state)")
            break
        }
    }
    func read_packet() throws -> GeneralPacketMojang {
        var data:Data = Data()
        let _:Int = try socket.read(into: &data)
        let bytes:[UInt8] = [UInt8](data)
        return try GeneralPacketMojang(bytes: bytes)
    }
    func read_and_parse_mojang_packet<T: PacketMojangJava>() throws -> T {
        let general_packet:GeneralPacketMojang = try read_packet()
        return try T.parse(general_packet)
    }
    
    public func close() {
        connection_task.cancel()
        ServerMojang.instance.close(connection: self)
    }
    
    private func parse_handshake() throws {
        let packet:GeneralPacketMojang = try read_packet()
        guard let test:ServerPacket.Mojang.Java.Handshaking = ServerPacket.Mojang.Java.Handshaking(rawValue: UInt8(packet.packetID.value)) else {
            ServerMojang.instance.logger.critical("ClientMojangJava;parse_handshake;failed to find packet with id \(packet.packetID.value)")
            return
        }
        let handshake_packet:any ServerPacketMojangJavaHandshakingProtocol.Type = test.packet
        let client_packet:any ServerPacketMojangJavaHandshakingProtocol = try handshake_packet.parse(packet)
        guard let handshake:ServerPacket.Mojang.Java.Handshaking.Handshake = client_packet as? ServerPacket.Mojang.Java.Handshaking.Handshake else { return }
        let next_state:ServerPacket.Mojang.Java.Handshaking.Handshake.State = handshake.next_state
        protocolVersion = handshake.protocolVersion
        ServerMojang.instance.logger.info(Logger.Message(stringLiteral: "ClientMojangJava;parse_handshake;success;handshake;protocolVersion=\(handshake.protocolVersion);server_address=" + handshake.server_address + ";server_port=\(handshake.server_port);next_state=\(next_state)"))
        switch next_state {
        case .status:
            state = ServerMojangStatus.status
            break
        case .login:
            state = ServerMojangStatus.login
            break
        }
    }
    
    private func parse_status() throws {
        var packet:GeneralPacketMojang = try read_packet()
        guard let test:ServerPacket.Mojang.Java.Status = ServerPacket.Mojang.Java.Status(rawValue: UInt8(packet.packetID.value)) else {
            ServerMojang.instance.logger.critical("ClientMojangJava;parse_status;failed to find packet with id \(packet.packetID.value)")
            return
        }
        ServerMojang.instance.logger.info("ClientMojangJava;parse_status;packet=\(test)")
        let pingRequest:ServerPacket.Mojang.Java.Status.PingRequest
        switch test {
        case .pingRequest:
            pingRequest = try ServerPacket.Mojang.Java.Status.PingRequest.parse(packet)
            break
        case .statusRequest:
            let statusRequest:ServerPacket.Mojang.Java.Status.StatusRequest = try ServerPacket.Mojang.Java.Status.StatusRequest.parse(packet)
            let statusResponse:ClientPacket.Mojang.Java.Status.StatusResponse = try ClientPacket.Mojang.Java.Status.StatusResponse(
                version: protocolVersion,
                motd: "Test bruh; your Minecraft Protocol Version == \(protocolVersion)",
                enforces_secure_chat: true,
                online_players_count: ServerMojang.instance.player_connections.count
            )
            try sendPacket(statusResponse)
            
            packet = try read_packet()
            pingRequest = try ServerPacket.Mojang.Java.Status.PingRequest.parse(packet)
            break
        }
        let pingResponse:ClientPacket.Mojang.Java.Status.PingResponse = ClientPacket.Mojang.Java.Status.PingResponse(payload: pingRequest.payload)
        try sendPacket(pingResponse)
        close()
    }
    private func parse_login() throws {
        var packet:GeneralPacketMojang = try read_packet()
        guard let test:ServerPacket.Mojang.Java.Login = ServerPacket.Mojang.Java.Login(rawValue: UInt8(packet.packetID.value)) else {
            ServerMojang.instance.logger.critical("ClientMojangJava;parse_login;failed to find packet with id \(packet.packetID.value)")
            return
        }
        ServerMojang.instance.logger.info("ClientMojangJava;parse_login;packet=\(test)")
        let login_start_packet:ServerPacket.Mojang.Java.Login.LoginStart = try ServerPacket.Mojang.Java.Login.LoginStart.parse(packet)
        player_builder = PlayerBuilder(uuid: login_start_packet.player_uuid, name: login_start_packet.name)
        
        switch test {
        case .loginStart:
            let online_mode:Bool = false
            if online_mode {
                let publicKey:String = ServerMojang.publicKey
                
                //var bruh = DER.Serializer()
                //bruh.serialize(SubjectPublicKeyInfo(algorithm: SubjectPublicKeyInfo.Algorithm, subjectPublicKey: <#T##ArraySlice<UInt8>#>))
                
                let yoink:String = "-----BEGIN PUBLIC KEY-----\n" + publicKey + "\n-----END PUBLIC KEY-----"
                let public_key_bytes:[UInt8] = [UInt8](yoink.utf8)
                
                let verifyToken:[UInt8] = [UInt8.random(), UInt8.random(), UInt8.random(), UInt8.random()]
                let encryptionRequest:ClientPacket.Mojang.Java.Login.EncryptionRequest = ClientPacket.Mojang.Java.Login.EncryptionRequest(
                    serverID: "",
                    publicKey: public_key_bytes,
                    verifyToken: verifyToken
                )
                try sendPacket(encryptionRequest)
                
                print("test1")
                packet = try read_packet()
                print("test2")
                let um:ServerPacket.Mojang.Java.Login.EncryptionResponse = try ServerPacket.Mojang.Java.Login.EncryptionResponse.parse(packet)
                print("test3")
            } else {
                let success_packet:ClientPacket.Mojang.Java.Login.LoginSuccess = ClientPacket.Mojang.Java.Login.LoginSuccess(
                    uuid: login_start_packet.player_uuid,
                    username: login_start_packet.name,
                    numberOfProperties: VariableIntegerJava(value: 0),
                    properties: []
                )
                try sendPacket(success_packet)
                
                packet = try read_packet() // acknowledged packet
            }
            state = .configuration
            break
        case .encryptionResponse:
            break
        case .loginAcknowledged:
            break
            
        case .loginPluginResponse:
            break
        }
    }
    
    private func parse_configuration() throws {
        var packet:GeneralPacketMojang = try read_packet()
        guard let test:ServerPacket.Mojang.Java.Configuration = ServerPacket.Mojang.Java.Configuration(rawValue: UInt8(packet.packetID.value)) else {
            ServerMojang.instance.logger.critical("ClientMojangJava;parse_configuration;failed to find packet with id \(packet.packetID.value)")
            return
        }
        ServerMojang.instance.logger.info("ClientMojangJava;parse_configuration;packet=\(test)")
        switch test {
        case .clientInformation:
            information = try ServerPacket.Mojang.Java.Configuration.ClientInformation.parse(packet)
            break
        default:
            break
        }
        
        let finishConfiguration:ServerPacket.Mojang.Java.Configuration.FinishConfiguration = ServerPacket.Mojang.Java.Configuration.FinishConfiguration()
        try sendPacket(finishConfiguration)
        
        state = .play
        let uuid:UUID = player_builder.uuid
        let world:any World = GluonServer.shared.worlds.first!.value
        let foodData:GluonFoodData = GluonFoodData(foodLevel: 10, saturationLevel: 0, exhaustionLevel: 0)
        let inventory_type:GluonInventoryType = GluonInventoryType(id: "minecraft:player", categories: [], size: 36, material_category_restrictions: [:], materialRestrictions: [:], allowedRecipeIDs: [])
        let inventory:GluonPlayerInventory = GluonPlayerInventory(type: inventory_type, held_item_slot: 0, items: [], viewers: [])
        player = PlayerJava(
            name: player_builder.name,
            experience: 0,
            experienceLevel: 0,
            foodData: foodData,
            permissions: [],
            statistics: [:],
            gameMode: GameMode.survival,
            isBlocking: false,
            isFlying: false,
            isOP: false,
            isSneaking: false,
            isSprinting: false,
            inventory: inventory,
            canBreatheUnderwater: false,
            canPickupItems: true,
            hasAI: false,
            isClimbing: false,
            isCollidable: true,
            isGliding: false,
            isInvisible: false,
            isLeashed: false,
            isRiptiding: false,
            isSleeping: false,
            isSwimming: false,
            potionEffects: [:],
            noDamageTicks: 0,
            noDamageTicksMaximum: 20,
            air_remaining: 20,
            air_maximum: 20,
            health: 20,
            healthMaximum: 20,
            
            id: UInt64.random(),
            uuid: uuid,
            type_id: "minecraft:player",
            ticks_lived: 0,
            boundaries: [],
            location: GluonLocation(world: world, x: 0, y: 0, z: 0, yaw: 0, pitch: 0),
            velocity: Vector(x: 0, y: 0, z: 0),
            fallDistance: 0,
            is_glowing: false,
            is_on_fire: false,
            is_on_ground: true,
            height: 0,
            fireTicks: 0,
            fireTicksMaximum: 0,
            freezeTicks: 0,
            freezeTicksMaximum: 0,
            passengerUUIDs: [],
            vehicleUUID: nil
        )
        ServerMojang.instance.upgrade(uuid: uuid, connection: self)
    }
    
    private func parse_play() throws {
        let packet:GeneralPacketMojang = try read_packet()
        guard let test:ServerPacket.Mojang.Java.Play = ServerPacket.Mojang.Java.Play(rawValue: UInt8(packet.packetID.value)) else {
            ServerMojang.instance.logger.critical("ClientMojangJava;parse_play;failed to find packet with id \(packet.packetID.value)")
            return
        }
        ServerMojang.instance.logger.info("ClientMojangJava;parse_play;packet=\(test)")
        try test.serverReceived(self)
    }
    
    public func sendPacket(_ packet: any PacketMojangJava) throws {
        let data:Data = try packet.as_client_response()
        try sendPacketData(data)
    }
    public func sendPacketData(_ packet_data: Data) throws {
        try socket.write(from: packet_data)
    }
}

struct ServerPacketMojangStatusResponse : Codable {
    let version:Version
    let players:Players
    let description:ChatPacketMojang
    let favicon:String?
    let enforcesSecureChat:Bool
    let previewsChat:Bool
    
    struct Version : Codable {
        let name:String
        let `protocol`:Int
    }
    struct Players : Codable {
        let max:Int
        let online:Int
        let sample:[Player]?
    }
    struct Player : Codable {
        let name:String
        let id:UUID
    }
}

public enum ServerMojangStatus {
    case handshaking
    case handshaking_received_packet
    case login
    case configuration
    case status
    case play
}

struct PlayerBuilder {
    var uuid:UUID
    var name:String
}

struct SubjectPublicKeyInfo : DERImplicitlyTaggable {
    static let defaultIdentifier:ASN1Identifier = ASN1Identifier.sequence
    
    var algorithm:Algorithm
    var subjectPublicKey:ArraySlice<UInt8>
    
    init(algorithm: Algorithm, subjectPublicKey: ArraySlice<UInt8>) {
        self.algorithm = algorithm
        self.subjectPublicKey = subjectPublicKey
    }
    
    init(derEncoded: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(derEncoded, identifier: identifier, { nodes in
            let algorithm:Algorithm = try Algorithm(derEncoded: &nodes)
            let subjectPublicKey:ArraySlice<UInt8> = try ArraySlice<UInt8>(derEncoded: &nodes)
            return SubjectPublicKeyInfo(algorithm: algorithm, subjectPublicKey: subjectPublicKey)
        })
    }
    
    func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(self.algorithm)
            try coder.serialize(self.subjectPublicKey)
        }
    }
    
    struct Algorithm : DERImplicitlyTaggable {
        static let defaultIdentifier:ASN1Identifier = ASN1Identifier.sequence
        
        let algorithm:ArraySlice<UInt8>
        let parameters:ArraySlice<UInt8>
        
        init(algorithm: ArraySlice<UInt8>, parameters: ArraySlice<UInt8>) {
            self.algorithm = algorithm
            self.parameters = parameters
        }
        
        init(derEncoded: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
            self = try DER.sequence(derEncoded, identifier: identifier, { nodes in
                let algorithm:ArraySlice<UInt8> = try ArraySlice<UInt8>(derEncoded: &nodes)
                let subjectPublicKey:ArraySlice<UInt8> = try ArraySlice<UInt8>(derEncoded: &nodes)
                return Algorithm(algorithm: algorithm, parameters: subjectPublicKey)
            })
        }
        
        func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
            try coder.appendConstructedNode(identifier: identifier) { coder in
                try coder.serialize(self.algorithm)
                try coder.serialize(self.parameters)
            }
        }
    }
}

struct SubjectPublicKey : DERImplicitlyTaggable {
    static let defaultIdentifier:ASN1Identifier = ASN1Identifier.sequence
    
    let modulus:Int
    let publicExponent:Int
    
    init(modulus: Int, publicExponent: Int) {
        self.modulus = modulus
        self.publicExponent = publicExponent
    }
    
    init(derEncoded: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(derEncoded, identifier: identifier, { nodes in
            let modulus:Int = try Int(derEncoded: &nodes)
            let publicExponent:Int = try Int(derEncoded: &nodes)
            return SubjectPublicKey(modulus: modulus, publicExponent: publicExponent)
        })
    }
    
    func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(self.modulus)
            try coder.serialize(self.publicExponent)
        }
    }
}
