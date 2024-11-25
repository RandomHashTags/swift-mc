//
//  GluonServer.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

final class GluonServer : GluonSharedInstance, Server {
    let chatManager:any ChatManager
    var version:SemanticVersion
    
    var ticksPerSecond:UInt8
    var ticksPerSecondMultiplier:Double
    var serverTickIntervalNano:UInt64
    var serverIsAwake:Bool
    var server_loop:Task<Void, Error>!
    var gravity:Double
    var gravityPerTick:Double
    var voidDamagePerTick:Double
    var fireDamagePerSecond:Double
    
    var maxPlayers:UInt64
    var port:Int
    var isWhitelisted:Bool
    var whitelistedPlayers:Set<UUID>
    var bannedPlayers:Set<BanEntry>
    var bannedIPAddresses:Set<BanEntry>
    
    var difficulties:[String : any Difficulty]
    var worlds:[String : any World]
    
    var event_types:[String : any EventType]
    
    var sound_categories:[String : SoundCategory]
    var sounds:[String : Sound]
    var materials:[String : Material]
    var biomes:[String : Biome]
    var enchantment_types:[String : EnchantmentType]
    var entity_types:[String : EntityType]
    var inventory_types:[String : any InventoryType]
    var potion_effect_types:[String : PotionEffectType]
    var game_modes:[String : GameMode]
    var advancements:[String : Advancement]
    var art:[String : any Art]
    var attributes:[String : any Attribute]
    var instruments:[String : Instrument]
    var statistics:[String : any Statistic]
    var commands:[String : any Command]
    var permissions:[String : any Permission]
    var recipes:[String : any Recipe]
    
    var event_listeners:[String:[any EventListener]]
    
    convenience init() {
        self.init(ticksPerSecond: 1)
    }
    private init(ticksPerSecond: UInt8) {
        chatManager = GluonChatManager()
        version = SemanticVersion(major: 1, minor: 20, patch: 4)
        
        let ticks_per_second_float:Double = Double(ticksPerSecond)
        self.ticksPerSecond = ticksPerSecond
        ticksPerSecondMultiplier = ticks_per_second_float / 20
        serverTickIntervalNano = 1_000_000_000 / UInt64(ticksPerSecond)
        serverIsAwake = false
        let gravity:Double = 9.80665
        self.gravity = gravity
        gravityPerTick = gravity / ticks_per_second_float
        voidDamagePerTick = 1 / Double(ticks_per_second_float)
        fireDamagePerSecond = 1
        
        ServerMojang.instance.logger.info("GluonServer;server_ticks_per_second=\(ticksPerSecond); 1 every \(1000 / Int(ticksPerSecond)) milliseconds")
        
        maxPlayers = 1
        port = 25565
        isWhitelisted = false
        whitelistedPlayers = []
        bannedPlayers = []
        bannedIPAddresses = []
        
        difficulties = [:]
        for difficulty in DifficultyJava.allCases {
            difficulties[difficulty.id] = difficulty
        }
        let spawn_location:Vector = Vector(x: 0, y: 0, z: 0)
        worlds = [
            "overworld" : GluonWorld(
                uuid: UUID(),
                seed: 0,
                name: "overworld",
                spawn_location: spawn_location,
                difficulty: DifficultyJava.normal,
                gameRules: [],
                time: 0,
                border: nil,
                yMin: -64,
                yMax: 320,
                ySeaLevel: 100,
                chunksLoaded: [],
                allowsAnimals: true,
                allowsMonsters: true,
                allowsPVP: true,
                bedsWork: true,
                entities: [],
                livingEntities: [],
                players: []
            )
        ]
        
        event_types = [:]
        
        sound_categories = [:]
        sounds = [:]
        materials = [:]
        biomes = [:]
        enchantment_types = [:]
        entity_types = [
            "minecraft.player" : GluonEntityType(id: "minecraft.player", name: "Player", is_affected_by_gravity: true, is_damageable: true, receives_fall_damage: true, noDamageTicksMaximum: 20, fireTicksMaximum: 20, freezeTicksMaximum: 20)
        ]
        inventory_types = [:]
        potion_effect_types = [:]
        
        game_modes = [:]
        for gameMode in GameModeJava.allCases {
            game_modes[gameMode.id] = gameMode
        }
        advancements = [:]
        art = [:]
        attributes = [:]
        instruments = [:]
        statistics = [:]
        
        commands = [:]
        for command in CommandsJava.allCases {
            commands[command.id] = command
        }
        
        permissions = [:]
        for permission in DefaultPermissions.allCases {
            permissions[permission.id] = permission
        }
        
        recipes = [:]
        
        event_listeners = [
            "" : [].sorted(by: { $0.priority < $1.priority })
        ]
    }
    
    func player_joined() {
        /*let inventory_type:GluonInventoryType = GluonInventoryType(
            id: "minecraft.player_hotbar",
            categories: [],
            size: 9,
            material_category_restrictions: nil,
            materialRestrictions: nil,
            allowedRecipeIDs: nil
        )
        let inventory:GluonPlayerInventory = GluonPlayerInventory(type: inventory_type, held_item_slot: 0, items: [], viewers: [])
        let player_uuid:UUID = UUID()
        let connection:PlayerConnectionMojang = PlayerConnectionMojang(player_uuid: player_uuid, platform: PacketPlatform.mojang_java, protocolVersion: MinecraftProtocolVersion.Java.v1_20_2, socket: <#T##Socket#>)
        let player:GluonPlayer = GluonPlayer(
            connection: connection,
            name: "RandomHashTags",
            experience: 0,
            experienceLevel: 0,
            foodLevel: 20,
            permissions: [],
            statistics: [:],
            gameMode: GameModeJava.survival,
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
            uuid: player_uuid,
            type_id: "minecraft.player",
            ticks_lived: 0,
            boundaries: [],
            location: GluonLocation(world: worlds.first!.value, x: HugeFloat.zero, y: HugeFloat.zero, z: HugeFloat.zero, yaw: 0, pitch: 0),
            velocity: Vector(x: HugeFloat.zero, y: HugeFloat.zero, z: HugeFloat.zero),
            fallDistance: 0,
            is_glowing: false,
            is_on_fire: false,
            is_on_ground: false,
            height: 5,
            fireTicks: 0,
            fireTicksMaximum: 20,
            freezeTicks: 0,
            freezeTicksMaximum: 20,
            passengerUUIDs: [],
            vehicleUUID: nil
        )
        worlds["overworld"]!.spawnPlayer(player)
        callEvent(event: GluonPlayerJoinEvent(player))*/
        
        if !serverIsAwake {
            wakeUp()
        }
    }
    
    func wakeUp() {
        guard !serverIsAwake else { return }
        serverIsAwake = true
        server_loop = Task {
            while serverIsAwake {
                tick(self)
                do {
                    try await Task.sleep(nanoseconds: serverTickIntervalNano)
                } catch {
                    ServerMojang.instance.logger.critical("GluonServer;caught an error while trying to sleep after ticking the server;error=\(error)")
                }
            }
        }
    }
    func setTickRate(ticksPerSecond: UInt8) {
        let previous_ticks_per_second:UInt8 = self.ticksPerSecond
        let was_slowed:Bool = ticksPerSecond < previous_ticks_per_second
        
        if ticksPerSecond != 20 {
            ticksPerSecondMultiplier = Double(ticksPerSecond / 20)
        }
        serverTickIntervalNano = 1_000_000_000 / UInt64(ticksPerSecond)
        gravityPerTick = gravity / Double(ticksPerSecond)
        
        if was_slowed {
            serverTPSSlowed(to: ticksPerSecond, divisor: UInt16(previous_ticks_per_second / ticksPerSecond))
        } else {
            serverTPSIncreased(to: ticksPerSecond, multiplier: UInt16(ticksPerSecond / previous_ticks_per_second))
        }
        self.ticksPerSecond = ticksPerSecond
    }
}

extension GluonServer {
    func boot_player(player: any Player, reason: String, ban_user: Bool = false, ban_expiration: Date? = nil, ban_ip: Bool = false) {
        let player_uuid:UUID = player.uuid
        ServerMojang.instance.close(player_uuid: player_uuid)
        
        let instance:GluonServer = GluonServer.shared
        if ban_user {
            instance.bannedPlayers.insert(BanEntry(banned_by: UUID(), target: player.uuid.uuidString, ban_time: Date(), expiration: ban_expiration, reason: reason))
        }
        if ban_ip {
            instance.bannedIPAddresses.insert(BanEntry(banned_by: UUID(), target: "PLAYER_IP_ADDRESS", ban_time: Date(), expiration: ban_expiration, reason: reason))
        }
        // TODO: send packets
    }
    func boot_player(disconnect_packet: ClientPacket.Mojang.Java.Play.Disconnect, player: any Player, ban_user: Bool = false, ban_expiration: Date? = nil, ban_ip: Bool = false) throws {
        let player_uuid:UUID = player.uuid
        try ServerMojang.instance.player_connections[player_uuid]?.sendPacket(disconnect_packet)
        ServerMojang.instance.close(player_uuid: player_uuid)
        
        let instance:GluonServer = GluonServer.shared
        if ban_user {
            let reason:String = disconnect_packet.reason.text
            instance.bannedPlayers.insert(BanEntry(banned_by: UUID(), target: player.uuid.uuidString, ban_time: Date(), expiration: ban_expiration, reason: reason))
        }
        if ban_ip {
            let reason:String = disconnect_packet.reason.text
            instance.bannedIPAddresses.insert(BanEntry(banned_by: UUID(), target: "PLAYER_IP_ADDRESS", ban_time: Date(), expiration: ban_expiration, reason: reason))
        }
        // TODO: send packets
    }
}
