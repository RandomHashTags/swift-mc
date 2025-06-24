import MinecraftPackets

public extension ClientPacket.Mojang.Java {
    enum Play: UInt8, PacketGameplayID {
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
        
        var packet: (any ClientPacketMojangJavaProtocol.Type)? {
            switch self {
            case .spawnEntity:                   return ClientPacket.Mojang.Java.Play.SpawnEntity.self
            case .spawnExperienceOrb:           return ClientPacket.Mojang.Java.Play.SpawnExperienceOrb.self
            case .spawnPlayer:                   return ClientPacket.Mojang.Java.Play.SpawnPlayer.self
            case .entityAnimation:               return ClientPacket.Mojang.Java.Play.EntityAnimation.self
            case .awardStatistic:                return ClientPacket.Mojang.Java.Play.AwardStatistics.self
            case .acknowledgeBlockChange:       return ClientPacket.Mojang.Java.Play.AcknowledgeBlockChange.self
            case .setBlockDestroyStage:        return ClientPacket.Mojang.Java.Play.SetBlockDestroyStage.self
                
            case .blockAction:                   return ClientPacket.Mojang.Java.Play.BlockAction.self
            case .blockUpdate:                   return ClientPacket.Mojang.Java.Play.BlockUpdate.self
            case .bossBar:                       return ClientPacket.Mojang.Java.Play.BossBar.self
            case .changeDifficulty:              return ClientPacket.Mojang.Java.Play.ChangeDifficulty.self
            case .chunkBiomes:                   return ClientPacket.Mojang.Java.Play.ChunkBiomes.self
            case .clearTitles:                   return ClientPacket.Mojang.Java.Play.ClearTitles.self
            case .commandSuggestionsResponse:   return ClientPacket.Mojang.Java.Play.CommandSuggestionsResponse.self
            case .commands:                       return ClientPacket.Mojang.Java.Play.Commands.self
            case .closeContainer:                return ClientPacket.Mojang.Java.Play.CloseContainer.self
            case .setContainerContent:          return ClientPacket.Mojang.Java.Play.SetContainerContent.self
            case .setContainerProperty:         return ClientPacket.Mojang.Java.Play.SetContainerProperty.self
            case .setContainerSlot:             return ClientPacket.Mojang.Java.Play.SetContainerSlot.self
            case .setCooldown:                   return ClientPacket.Mojang.Java.Play.SetCooldown.self
            case .chatSuggestions:               return ClientPacket.Mojang.Java.Play.ChatSuggestions.self
            case .pluginMessage:                 return ClientPacket.Mojang.Java.Play.PluginMessage.self
            case .damageEvent:                   return ClientPacket.Mojang.Java.Play.DamageEvent.self
            case .deleteMessage:                 return ClientPacket.Mojang.Java.Play.DeleteMessage.self
            case .disconnect:                     return ClientPacket.Mojang.Java.Play.Disconnect.self
            case .disguisedChatMessage:         return ClientPacket.Mojang.Java.Play.DisguisedChatMessage.self
            case .entityEvent:                   return ClientPacket.Mojang.Java.Play.EntityEvent.self
            case .explosion:                      return ClientPacket.Mojang.Java.Play.Explosion.self
            case .unloadChunk:                   return ClientPacket.Mojang.Java.Play.UnloadChunk.self
            case .gameEvent:                     return ClientPacket.Mojang.Java.Play.GameEvent.self
            case .openHorseScreen:              return ClientPacket.Mojang.Java.Play.OpenHorseScreen.self
            case .hurtAnimation:                 return ClientPacket.Mojang.Java.Play.HurtAnimation.self
            case .initializeWorldBorder:        return ClientPacket.Mojang.Java.Play.InitializeWorldBorder.self
            case .keepAlive:                     return ClientPacket.Mojang.Java.Play.KeepAlive.self
                
            case .ping:                           return ClientPacket.Mojang.Java.Play.Ping.self
            case .placeGhostRecipe:             return ClientPacket.Mojang.Java.Play.PlaceGhostRecipe.self
            case .playerAbilities:               return ClientPacket.Mojang.Java.Play.PlayerAbilities.self
            case .playerChatMessage:            return ClientPacket.Mojang.Java.Play.PlayerChatMessage.self
                
            case .serverData:                    return ClientPacket.Mojang.Java.Play.ServerData.self
            case .setActionBarText:            return ClientPacket.Mojang.Java.Play.SetActionBarText.self
            case .setBorderCenter:              return ClientPacket.Mojang.Java.Play.SetBorderCenter.self
            case .setBorderLerpSize:           return ClientPacket.Mojang.Java.Play.SetBorderLerpSize.self
            case .setBorderSize:                return ClientPacket.Mojang.Java.Play.SetBorderSize.self
            case .setBorderWarningDelay:       return ClientPacket.Mojang.Java.Play.SetBorderWarningDelay.self
            case .setBorderWarningDistance:    return ClientPacket.Mojang.Java.Play.SetBorderWarningDistance.self
            case .setCamera:                     return ClientPacket.Mojang.Java.Play.SetCamera.self
            case .setHeldItem:                  return ClientPacket.Mojang.Java.Play.SetHeldItem.self
            case .setCenterChunk:               return ClientPacket.Mojang.Java.Play.SetCenterChunk.self
            case .setRenderDistance:            return ClientPacket.Mojang.Java.Play.SetRenderDistance.self
            case .setDefaultSpawnPosition:     return ClientPacket.Mojang.Java.Play.SetDefaultSpawnPosition.self
            case .displayObjective:              return ClientPacket.Mojang.Java.Play.DisplayObjective.self
                
            case .linkEntities:                  return ClientPacket.Mojang.Java.Play.LinkEntities.self
            case .setEntityVelocity:            return ClientPacket.Mojang.Java.Play.SetEntityVelocity.self
                
            case .setExperience:                 return ClientPacket.Mojang.Java.Play.SetExperience.self
            case .setHealth:                     return ClientPacket.Mojang.Java.Play.SetHealth.self
                
            case .setPassengers:                 return ClientPacket.Mojang.Java.Play.SetPassengers.self
            case .updateTeams:                   return ClientPacket.Mojang.Java.Play.UpdateTeams.self
            case .updateScore:                   return ClientPacket.Mojang.Java.Play.UpdateScore.self
            case .setSimulationDistance:        return ClientPacket.Mojang.Java.Play.SetSimulationDistance.self
            case .setSubtitleText:              return ClientPacket.Mojang.Java.Play.SetSubtitleText.self
            case .updateTime:                    return ClientPacket.Mojang.Java.Play.UpdateTime.self
            case .setTitleText:                 return ClientPacket.Mojang.Java.Play.SetTitleText.self
            case .setTitleAnimationTimes:      return ClientPacket.Mojang.Java.Play.SetTitleAnimationTimes.self
            case .entitySoundEffect:            return ClientPacket.Mojang.Java.Play.EntitySoundEffect.self
            case .soundEffect:                   return ClientPacket.Mojang.Java.Play.SoundEffect.self
            case .stopSound:                     return ClientPacket.Mojang.Java.Play.StopSound.self
            case .systemChatMessage:            return ClientPacket.Mojang.Java.Play.SystemChatMessage.self
            case .setTabListHeaderAndFooter: return ClientPacket.Mojang.Java.Play.SetTabListHeaderAndFooter.self
            case .tagQueryResponse:             return ClientPacket.Mojang.Java.Play.TagQueryResponse.self
            case .pickupItem:                    return ClientPacket.Mojang.Java.Play.PickupItem.self
            case .teleportEntity:                return ClientPacket.Mojang.Java.Play.TeleportEntity.self
                
            case .featureFlags:                  return ClientPacket.Mojang.Java.Play.FeatureFlags.self
                
            case .updateRecipes:                 return ClientPacket.Mojang.Java.Play.UpdateRecipes.self
            case .updateTags:                    return ClientPacket.Mojang.Java.Play.UpdateTags.self
            default:
                return nil
            }
        }
    }
}
