//
//  PlayerJava.swift
//
//
//  Created by Evan Anderson on 11/26/23.
//

import API

final class PlayerJava : Player { // TODO: fix
    func remove() {
        
    }
    
    func teleport(_ location: any Location) {
        
    }
    
    var name:String
    var listName:String?
    
    var experience:UInt64
    var experienceLevel:UInt64
    var foodData:any FoodData
    
    var permissions:Set<String>
    var statistics:[String : any StatisticActive]
    
    var gameMode:GameMode
    
    var isBlocking:Bool
    var isFlying:Bool
    var isOP:Bool
    var isSneaking:Bool
    var isSprinting:Bool
    
    var inventory:any PlayerInventory
    
    var canBreatheUnderwater:Bool
    var canPickupItems:Bool
    var hasAI:Bool
    
    var isClimbing:Bool
    var isCollidable:Bool
    var isGliding:Bool
    var isInvisible:Bool
    var isLeashed:Bool
    var isRiptiding:Bool
    var isSleeping:Bool
    var isSwimming:Bool
    
    var potionEffects:[String:any PotionEffect]
    
    var noDamageTicks:UInt16
    var noDamageTicksMaximum:UInt16
    
    var airRemainingTicks:UInt16
    var airMaximumTicks:UInt16
    
    var health:Double
    var healthMaximum:Double
    
    var id:UInt64
    var uuid:UUID
    var typeID:String
    var type : (EntityType)? {
        return GluonServer.shared.get_entity_type(identifier: type_id)
    }
    
    var ticks_lived:UInt64
    var customName:String?
    var displayName:String?
    var boundaries:[Boundary]
    var location:any Location
    var lastSleptLocation:(any Location)?
    var velocity:Vector
    var fallDistance:Float
    
    var is_glowing:Bool
    var is_on_fire:Bool
    var is_on_ground:Bool
    
    var height:Float
    
    var fireTicks:UInt16
    var fireTicksMaximum:UInt16
    
    var freezeTicks:UInt16
    var freezeTicksMaximum:UInt16
    
    var passengerUUIDs:Set<UUID>
    var passengers : [any Entity] {
        return GluonServer.shared.getEntities(uuids: passengerUUIDs)
    }
    
    var vehicleUUID:UUID?
    var vehicle : (any Entity)? {
        guard let uuid:UUID = vehicleUUID else { return nil }
        return GluonServer.shared.getEntity(uuid: uuid)
    }
    
    func setGameMode(_ gameMode: GameMode) {
        guard !self.gameMode.id.elementsEqual(gameMode.id) else { return }
        let event:GluonPlayerGameModeChangeEvent = GluonPlayerGameModeChangeEvent(player: self, newGameMode: gameMode)
        GluonServer.shared.callEvent(event: event)
        guard !event.isCancelled else { return }
        self.gameMode = gameMode
    }
    
    func kick(reason: String) {
        GluonServer.shared.boot_player(player: self, reason: reason)
    }
    
    func consumed(item: inout ItemStack) {
        guard let consumable_configuration:any MaterialItemConsumableConfiguration = item.material?.configuration.item?.consumable else { return }
        let event:GluonPlayerItemConsumeEvent = GluonPlayerItemConsumeEvent(player: self, item: &item)
        GluonServer.shared.callEvent(event: event)
        guard !event.isCancelled else { return }
        item.amount -= 1
    }
    
    func sendPacket(_ packet: any PacketMojangJava) throws {
        try ServerMojang.instance.player_connections[uuid]!.sendPacket(packet)
    }
    
    func send(message: String) async {
        await GluonServer.shared.chatManager.send(sender: self, receiver: nil, message: message)
    }
    
    init(
        name: String,
        experience: UInt64,
        experienceLevel: UInt64,
        foodData: any FoodData,
        permissions: Set<String>,
        statistics: [String:any StatisticActive],
        gameMode: GameMode,
        isBlocking: Bool,
        isFlying: Bool,
        isOP: Bool,
        isSneaking: Bool,
        isSprinting: Bool,
        inventory: any PlayerInventory,
        canBreatheUnderwater: Bool,
        canPickupItems: Bool,
        hasAI: Bool,
        isClimbing: Bool,
        isCollidable: Bool,
        isGliding: Bool,
        isInvisible: Bool,
        isLeashed: Bool,
        isRiptiding: Bool,
        isSleeping: Bool,
        isSwimming: Bool,
        potionEffects: [String:any PotionEffect],
        noDamageTicks: UInt16,
        noDamageTicksMaximum: UInt16,
        air_remaining: UInt16,
        air_maximum: UInt16,
        health: Double,
        healthMaximum: Double,
        id: UInt64,
        uuid: UUID,
        type_id: String,
        ticks_lived: UInt64,
        boundaries: [Boundary],
        location: any Location,
        velocity: Vector,
        fallDistance: Float,
        is_glowing: Bool,
        is_on_fire: Bool,
        is_on_ground: Bool,
        height: Float,
        fireTicks: UInt16,
        fireTicksMaximum: UInt16,
        freezeTicks: UInt16,
        freezeTicksMaximum: UInt16,
        passengerUUIDs: Set<UUID>,
        vehicleUUID: UUID?
    ) {
        self.name = name
        self.experience = experience
        self.experienceLevel = experienceLevel
        self.foodData = foodData
        self.permissions = permissions
        self.statistics = statistics
        self.gameMode = gameMode
        self.isBlocking = isBlocking
        self.isFlying = isFlying
        self.isOP = isOP
        self.isSneaking = isSneaking
        self.isSprinting = isSprinting
        self.inventory = inventory
        self.canBreatheUnderwater = canBreatheUnderwater
        self.canPickupItems = canPickupItems
        self.hasAI = hasAI
        self.isClimbing = isClimbing
        self.isCollidable = isCollidable
        self.isGliding = isGliding
        self.isInvisible = isInvisible
        self.isLeashed = isLeashed
        self.isRiptiding = isRiptiding
        self.isSleeping = isSleeping
        self.isSwimming = isSwimming
        self.potionEffects = potionEffects
        self.noDamageTicks = noDamageTicks
        self.noDamageTicksMaximum = noDamageTicksMaximum
        self.airRemainingTicks = air_remaining
        self.airMaximumTicks = air_maximum
        self.health = health
        self.healthMaximum = healthMaximum
        self.id = id
        self.uuid = uuid
        self.type_id = type_id
        self.ticks_lived = ticks_lived
        self.boundaries = boundaries
        self.location = location
        self.velocity = velocity
        self.fallDistance = fallDistance
        self.is_glowing = is_glowing
        self.is_on_fire = is_on_fire
        self.is_on_ground = is_on_ground
        self.height = height
        self.fireTicks = fireTicks
        self.fireTicksMaximum = fireTicksMaximum
        self.freezeTicks = freezeTicks
        self.freezeTicksMaximum = freezeTicksMaximum
        self.passengerUUIDs = passengerUUIDs
        self.vehicleUUID = vehicleUUID
    }
}
