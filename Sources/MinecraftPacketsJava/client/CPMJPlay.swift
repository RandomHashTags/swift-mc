import MinecraftPackets

extension ClientPacket.Mojang.Java {
    public enum Play: UInt8, PacketGameplayID {
        case bundleDelimiter = 0
        case spawnEntity =     1
        case spawnExperienceOrb
        case spawnPlayer
        case entityAnimation
        case awardStatistic
        case acknowledgeBlockChange
        case setBlockDestroyStage
        case blockEntityData
        case blockAction
        case blockUpdate
        case bossBar
        case changeDifficulty
        case chunkBiomes
        case clearTitles
        case commandSuggestionsResponse
        case commands
        case closeContainer
        case setContainerContent
        case setContainerProperty
        case setContainerSlot
        case setCooldown
        case chatSuggestions
        case pluginMessage
        case damageEvent
        case deleteMessage
        case disconnect
        case disguisedChatMessage
        case entityEvent
        case explosion
        case unloadChunk
        case gameEvent
        case openHorseScreen
        case hurtAnimation
        case initializeWorldBorder
        case keepAlive
        case chunkDaaAndUpdateLight
        case worldEvent
        case particle
        case updateLight
        case login
        case mapData
        case merchantOffers
        case updateEntityPosition
        case updateEntityPositionAndRotation
        case updateEntityRotation
        case moveVehicle
        case openBook
        case openScreen
        case openSignEditor
        case ping
        case placeGhostRecipe
        case playerAbilities
        case playerChatMessage
        case endCombat
        case enterCombat
        case combatDeath
        case playerInfoRemove
        case playerInfoUpdate
        case lookAt
        case synchronizePlayerPosition
        case updateRecipeBook
        case removeEntities
        case remoteEntityEffect
        case resourcePack
        case respawn
        case setHeadRotation
        case updateSectionBlocks
        case selectAdvancementsTab
        case serverData
        case setActionBarText
        case setBorderCenter
        case setBorderLerpSize
        case setBorderSize
        case setBorderWarningDelay
        case setBorderWarningDistance
        case setCamera
        case setHeldItem
        case setCenterChunk
        case setRenderDistance
        case setDefaultSpawnPosition
        case displayObjective
        case setEntityMetadata
        case linkEntities
        case setEntityVelocity
        case setEquipment
        case setExperience
        case setHealth
        case updateObjectives
        case setPassengers
        case updateTeams
        case updateScore
        case setSimulationDistance
        case setSubtitleText
        case updateTime
        case setTitleText
        case setTitleAnimationTimes
        case entitySoundEffect
        case soundEffect
        case stopSound
        case systemChatMessage
        case setTabListHeaderAndFooter
        case tagQueryResponse
        case pickupItem
        case teleportEntity
        case updateAdvancements
        case updateAttributes
        case featureFlags
        case entityEffect
        case updateRecipes
        case updateTags

        @inlinable
        public var packet: (any ClientPacketMojangJavaProtocol.Type)? {
            switch self {
            case .spawnEntity:                 ClientPacket.Mojang.Java.Play.SpawnEntity.self
            case .spawnExperienceOrb:          ClientPacket.Mojang.Java.Play.SpawnExperienceOrb.self
            case .spawnPlayer:                 ClientPacket.Mojang.Java.Play.SpawnPlayer.self
            case .entityAnimation:             ClientPacket.Mojang.Java.Play.EntityAnimation.self
            case .awardStatistic:              ClientPacket.Mojang.Java.Play.AwardStatistics.self
            case .acknowledgeBlockChange:      ClientPacket.Mojang.Java.Play.AcknowledgeBlockChange.self
            case .setBlockDestroyStage:        ClientPacket.Mojang.Java.Play.SetBlockDestroyStage.self
                
            case .blockAction:                 ClientPacket.Mojang.Java.Play.BlockAction.self
            case .blockUpdate:                 ClientPacket.Mojang.Java.Play.BlockUpdate.self
            case .bossBar:                     ClientPacket.Mojang.Java.Play.BossBar.self
            case .changeDifficulty:            ClientPacket.Mojang.Java.Play.ChangeDifficulty.self
            case .chunkBiomes:                 ClientPacket.Mojang.Java.Play.ChunkBiomes.self
            case .clearTitles:                 ClientPacket.Mojang.Java.Play.ClearTitles.self
            case .commandSuggestionsResponse:  ClientPacket.Mojang.Java.Play.CommandSuggestionsResponse.self
            case .commands:                    ClientPacket.Mojang.Java.Play.Commands.self
            case .closeContainer:              ClientPacket.Mojang.Java.Play.CloseContainer.self
            case .setContainerContent:         ClientPacket.Mojang.Java.Play.SetContainerContent.self
            case .setContainerProperty:        ClientPacket.Mojang.Java.Play.SetContainerProperty.self
            case .setContainerSlot:            ClientPacket.Mojang.Java.Play.SetContainerSlot.self
            case .setCooldown:                 ClientPacket.Mojang.Java.Play.SetCooldown.self
            case .chatSuggestions:             ClientPacket.Mojang.Java.Play.ChatSuggestions.self
            case .pluginMessage:               ClientPacket.Mojang.Java.Play.PluginMessage.self
            case .damageEvent:                 ClientPacket.Mojang.Java.Play.DamageEvent.self
            case .deleteMessage:               ClientPacket.Mojang.Java.Play.DeleteMessage.self
            case .disconnect:                  ClientPacket.Mojang.Java.Play.Disconnect.self
            case .disguisedChatMessage:        ClientPacket.Mojang.Java.Play.DisguisedChatMessage.self
            case .entityEvent:                 ClientPacket.Mojang.Java.Play.EntityEvent.self
            case .explosion:                   ClientPacket.Mojang.Java.Play.Explosion.self
            case .unloadChunk:                 ClientPacket.Mojang.Java.Play.UnloadChunk.self
            case .gameEvent:                   ClientPacket.Mojang.Java.Play.GameEvent.self
            case .openHorseScreen:             ClientPacket.Mojang.Java.Play.OpenHorseScreen.self
            case .hurtAnimation:               ClientPacket.Mojang.Java.Play.HurtAnimation.self
            case .initializeWorldBorder:       ClientPacket.Mojang.Java.Play.InitializeWorldBorder.self
            case .keepAlive:                   ClientPacket.Mojang.Java.Play.KeepAlive.self
                
            case .ping:                        ClientPacket.Mojang.Java.Play.Ping.self
            case .placeGhostRecipe:            ClientPacket.Mojang.Java.Play.PlaceGhostRecipe.self
            case .playerAbilities:             ClientPacket.Mojang.Java.Play.PlayerAbilities.self
            case .playerChatMessage:           ClientPacket.Mojang.Java.Play.PlayerChatMessage.self
                
            case .serverData:                  ClientPacket.Mojang.Java.Play.ServerData.self
            case .setActionBarText:            ClientPacket.Mojang.Java.Play.SetActionBarText.self
            case .setBorderCenter:             ClientPacket.Mojang.Java.Play.SetBorderCenter.self
            case .setBorderLerpSize:           ClientPacket.Mojang.Java.Play.SetBorderLerpSize.self
            case .setBorderSize:               ClientPacket.Mojang.Java.Play.SetBorderSize.self
            case .setBorderWarningDelay:       ClientPacket.Mojang.Java.Play.SetBorderWarningDelay.self
            case .setBorderWarningDistance:    ClientPacket.Mojang.Java.Play.SetBorderWarningDistance.self
            case .setCamera:                   ClientPacket.Mojang.Java.Play.SetCamera.self
            case .setHeldItem:                 ClientPacket.Mojang.Java.Play.SetHeldItem.self
            case .setCenterChunk:              ClientPacket.Mojang.Java.Play.SetCenterChunk.self
            case .setRenderDistance:           ClientPacket.Mojang.Java.Play.SetRenderDistance.self
            case .setDefaultSpawnPosition:     ClientPacket.Mojang.Java.Play.SetDefaultSpawnPosition.self
            case .displayObjective:            ClientPacket.Mojang.Java.Play.DisplayObjective.self
                
            case .linkEntities:                ClientPacket.Mojang.Java.Play.LinkEntities.self
            case .setEntityVelocity:           ClientPacket.Mojang.Java.Play.SetEntityVelocity.self
                
            case .setExperience:               ClientPacket.Mojang.Java.Play.SetExperience.self
            case .setHealth:                   ClientPacket.Mojang.Java.Play.SetHealth.self
                
            case .setPassengers:               ClientPacket.Mojang.Java.Play.SetPassengers.self
            case .updateTeams:                 ClientPacket.Mojang.Java.Play.UpdateTeams.self
            case .updateScore:                 ClientPacket.Mojang.Java.Play.UpdateScore.self
            case .setSimulationDistance:       ClientPacket.Mojang.Java.Play.SetSimulationDistance.self
            case .setSubtitleText:             ClientPacket.Mojang.Java.Play.SetSubtitleText.self
            case .updateTime:                  ClientPacket.Mojang.Java.Play.UpdateTime.self
            case .setTitleText:                ClientPacket.Mojang.Java.Play.SetTitleText.self
            case .setTitleAnimationTimes:      ClientPacket.Mojang.Java.Play.SetTitleAnimationTimes.self
            case .entitySoundEffect:           ClientPacket.Mojang.Java.Play.EntitySoundEffect.self
            case .soundEffect:                 ClientPacket.Mojang.Java.Play.SoundEffect.self
            case .stopSound:                   ClientPacket.Mojang.Java.Play.StopSound.self
            case .systemChatMessage:           ClientPacket.Mojang.Java.Play.SystemChatMessage.self
            case .setTabListHeaderAndFooter:   ClientPacket.Mojang.Java.Play.SetTabListHeaderAndFooter.self
            case .tagQueryResponse:            ClientPacket.Mojang.Java.Play.TagQueryResponse.self
            case .pickupItem:                  ClientPacket.Mojang.Java.Play.PickupItem.self
            case .teleportEntity:              ClientPacket.Mojang.Java.Play.TeleportEntity.self
                
            case .featureFlags:                ClientPacket.Mojang.Java.Play.FeatureFlags.self
                
            case .updateRecipes:               ClientPacket.Mojang.Java.Play.UpdateRecipes.self
            case .updateTags:                  ClientPacket.Mojang.Java.Play.UpdateTags.self
            default:                           nil
            }
        }
    }
}
