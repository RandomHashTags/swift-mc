//
//  SPMJPlay.swift
//  
//
//  Created by Evan Anderson on 8/2/23.
//

import MinecraftPackets

public extension ServerPacket.Mojang.Java {
    enum Play : UInt8, PacketGameplayID {
        case confirmTeleportation = 0
        case queryBlockEntityTag = 1
        case changeDifficulty
        case messageAcknowledgement
        case chatCommand
        case chatMessage
        case playerSession
        case clientCommand
        case clientInformation
        case commandSuggestionsRequest
        case clickContainerButton
        case clickContainer
        case closeContainer
        case pluginMessage
        case editBook
        case queryEntityTag
        case interact
        case jigsawGenerate
        case keepAlive
        case lockDifficulty
        case setPlayerPosition
        case setPlayerPositionAndRotation
        case setPlayerRotation
        case setPlayerOnGround
        case moveVehicle
        case paddleBoat
        case pickItem
        case placeRecipe
        case playerAbilities
        case playerAction
        case playerCommand
        case playerInput
        case pong
        case changeRecipeBookSettings
        case setSeenRecipe
        case rename_item
        case resourcePack
        case seenAdvancements
        case selectTrade
        case setBeaconEffect
        case setHeldItem
        case programCommandBlock
        case programCommandBlockMinecart
        case setCreativeModeSlot
        case programJigsawBlock
        case programStructureBlock
        case updateSign
        case swingArm
        case teleportToEntity
        case useItemOn
        case useItem
        
        var packet : any ServerPacketMojangJavaPlayProtocol.Type {
            switch self {
            case .confirmTeleportation:            return ServerPacket.Mojang.Java.Play.ConfirmTeleportation.self
            case .queryBlockEntityTag:           return ServerPacket.Mojang.Java.Play.QueryBlockEntityTag.self
            case .changeDifficulty:                return ServerPacket.Mojang.Java.Play.ChangeDifficulty.self
            case .messageAcknowledgement:          return ServerPacket.Mojang.Java.Play.MessageAcknowledgment.self
            case .chatCommand:                     return ServerPacket.Mojang.Java.Play.ChatCommand.self
            case .chatMessage:                     return ServerPacket.Mojang.Java.Play.ChatMessage.self
            case .playerSession:                   return ServerPacket.Mojang.Java.Play.PlayerSession.self
            case .clientCommand:                   return ServerPacket.Mojang.Java.Play.ClientCommand.self
            case .clientInformation:               return ServerPacket.Mojang.Java.Play.ClientInformation.self
            case .commandSuggestionsRequest:      return ServerPacket.Mojang.Java.Play.CommandSuggestionsRequest.self
            case .clickContainerButton:           return ServerPacket.Mojang.Java.Play.ClickContainerButton.self
            case .clickContainer:                  return ServerPacket.Mojang.Java.Play.ClickContainer.self
            case .closeContainer:                  return ServerPacket.Mojang.Java.Play.CloseContainer.self
            case .pluginMessage:                   return ServerPacket.Mojang.Java.Play.PluginMessage.self
            case .editBook:                        return ServerPacket.Mojang.Java.Play.EditBook.self
            case .queryEntityTag:                 return ServerPacket.Mojang.Java.Play.QueryEntityTag.self
            case .interact:                         return ServerPacket.Mojang.Java.Play.Interact.self
            case .jigsawGenerate:                  return ServerPacket.Mojang.Java.Play.JigsawGenerate.self
            case .keepAlive:                       return ServerPacket.Mojang.Java.Play.KeepAlive.self
            case .lockDifficulty:                  return ServerPacket.Mojang.Java.Play.LockDifficulty.self
            case .setPlayerPosition:              return ServerPacket.Mojang.Java.Play.SetPlayerPosition.self
            case .setPlayerPositionAndRotation: return ServerPacket.Mojang.Java.Play.SetPlayerPositionAndRotation.self
            case .setPlayerRotation:              return ServerPacket.Mojang.Java.Play.SetPlayerRotation.self
            case .setPlayerOnGround:             return ServerPacket.Mojang.Java.Play.SetPlayerOnGround.self
            case .moveVehicle:                     return ServerPacket.Mojang.Java.Play.MoveVehicle.self
            case .paddleBoat:                      return ServerPacket.Mojang.Java.Play.PaddleBoat.self
            case .pickItem:                        return ServerPacket.Mojang.Java.Play.PickItem.self
            case .placeRecipe:                     return ServerPacket.Mojang.Java.Play.PlaceRecipe.self
            case .playerAbilities:                 return ServerPacket.Mojang.Java.Play.PlayerAbilities.self
            case .playerAction:                    return ServerPacket.Mojang.Java.Play.PlayerAction.self
            case .playerCommand:                   return ServerPacket.Mojang.Java.Play.PlayerCommand.self
            case .playerInput:                     return ServerPacket.Mojang.Java.Play.PlayerInput.self
            case .pong:                             return ServerPacket.Mojang.Java.Play.Pong.self
            case .changeRecipeBookSettings:      return ServerPacket.Mojang.Java.Play.ChangeRecipeBookSettings.self
            case .setSeenRecipe:                  return ServerPacket.Mojang.Java.Play.SetSeenRecipe.self
            case .rename_item:                      return ServerPacket.Mojang.Java.Play.RenameItem.self
            case .resourcePack:                    return ServerPacket.Mojang.Java.Play.ResourcePack.self
            case .seenAdvancements:                return ServerPacket.Mojang.Java.Play.SeenAdvancements.self
            case .selectTrade:                     return ServerPacket.Mojang.Java.Play.SelectTrade.self
            case .setBeaconEffect:                return ServerPacket.Mojang.Java.Play.SetBeaconEffect.self
            case .setHeldItem:                    return ServerPacket.Mojang.Java.Play.SetHeldItem.self
            case .programCommandBlock:            return ServerPacket.Mojang.Java.Play.ProgramCommandBlock.self
            case .programCommandBlockMinecart:   return ServerPacket.Mojang.Java.Play.ProgramCommandBlockMinecart.self
            case .setCreativeModeSlot:           return ServerPacket.Mojang.Java.Play.SetCreativeMoveSlot.self
            case .programJigsawBlock:             return ServerPacket.Mojang.Java.Play.ProgramJigsawBlock.self
            case .programStructureBlock:          return ServerPacket.Mojang.Java.Play.ProgramStructureBlock.self
            case .updateSign:                      return ServerPacket.Mojang.Java.Play.UpdateSign.self
            case .swingArm:                        return ServerPacket.Mojang.Java.Play.SwingArm.self
            case .teleportToEntity:               return ServerPacket.Mojang.Java.Play.TeleportToEntity.self
            case .useItemOn:                      return ServerPacket.Mojang.Java.Play.UseItemOn.self
            case .useItem:                         return ServerPacket.Mojang.Java.Play.UseItem.self
            }
        }
        
        func serverReceived(_ client: any MinecraftClientHandler) throws {
            try packet.serverReceived(client)
        }
    }
}
