
import MinecraftPackets

extension ServerPacket.Mojang.Java {
    public enum Play: UInt8, PacketGameplayID {
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
        
        @inlinable
        public var packet: any ServerPacketMojangJavaPlayProtocol.Type {
            switch self {
            case .confirmTeleportation:         ServerPacket.Mojang.Java.Play.ConfirmTeleportation.self
            case .queryBlockEntityTag:          ServerPacket.Mojang.Java.Play.QueryBlockEntityTag.self
            case .changeDifficulty:             ServerPacket.Mojang.Java.Play.ChangeDifficulty.self
            case .messageAcknowledgement:       ServerPacket.Mojang.Java.Play.MessageAcknowledgment.self
            case .chatCommand:                  ServerPacket.Mojang.Java.Play.ChatCommand.self
            case .chatMessage:                  ServerPacket.Mojang.Java.Play.ChatMessage.self
            case .playerSession:                ServerPacket.Mojang.Java.Play.PlayerSession.self
            case .clientCommand:                ServerPacket.Mojang.Java.Play.ClientCommand.self
            case .clientInformation:            ServerPacket.Mojang.Java.Play.ClientInformation.self
            case .commandSuggestionsRequest:    ServerPacket.Mojang.Java.Play.CommandSuggestionsRequest.self
            case .clickContainerButton:         ServerPacket.Mojang.Java.Play.ClickContainerButton.self
            case .clickContainer:               ServerPacket.Mojang.Java.Play.ClickContainer.self
            case .closeContainer:               ServerPacket.Mojang.Java.Play.CloseContainer.self
            case .pluginMessage:                ServerPacket.Mojang.Java.Play.PluginMessage.self
            case .editBook:                     ServerPacket.Mojang.Java.Play.EditBook.self
            case .queryEntityTag:               ServerPacket.Mojang.Java.Play.QueryEntityTag.self
            case .interact:                     ServerPacket.Mojang.Java.Play.Interact.self
            case .jigsawGenerate:               ServerPacket.Mojang.Java.Play.JigsawGenerate.self
            case .keepAlive:                    ServerPacket.Mojang.Java.Play.KeepAlive.self
            case .lockDifficulty:               ServerPacket.Mojang.Java.Play.LockDifficulty.self
            case .setPlayerPosition:            ServerPacket.Mojang.Java.Play.SetPlayerPosition.self
            case .setPlayerPositionAndRotation: ServerPacket.Mojang.Java.Play.SetPlayerPositionAndRotation.self
            case .setPlayerRotation:            ServerPacket.Mojang.Java.Play.SetPlayerRotation.self
            case .setPlayerOnGround:            ServerPacket.Mojang.Java.Play.SetPlayerOnGround.self
            case .moveVehicle:                  ServerPacket.Mojang.Java.Play.MoveVehicle.self
            case .paddleBoat:                   ServerPacket.Mojang.Java.Play.PaddleBoat.self
            case .pickItem:                     ServerPacket.Mojang.Java.Play.PickItem.self
            case .placeRecipe:                  ServerPacket.Mojang.Java.Play.PlaceRecipe.self
            case .playerAbilities:              ServerPacket.Mojang.Java.Play.PlayerAbilities.self
            case .playerAction:                 ServerPacket.Mojang.Java.Play.PlayerAction.self
            case .playerCommand:                ServerPacket.Mojang.Java.Play.PlayerCommand.self
            case .playerInput:                  ServerPacket.Mojang.Java.Play.PlayerInput.self
            case .pong:                         ServerPacket.Mojang.Java.Play.Pong.self
            case .changeRecipeBookSettings:     ServerPacket.Mojang.Java.Play.ChangeRecipeBookSettings.self
            case .setSeenRecipe:                ServerPacket.Mojang.Java.Play.SetSeenRecipe.self
            case .rename_item:                  ServerPacket.Mojang.Java.Play.RenameItem.self
            case .resourcePack:                 ServerPacket.Mojang.Java.Play.ResourcePack.self
            case .seenAdvancements:             ServerPacket.Mojang.Java.Play.SeenAdvancements.self
            case .selectTrade:                  ServerPacket.Mojang.Java.Play.SelectTrade.self
            case .setBeaconEffect:              ServerPacket.Mojang.Java.Play.SetBeaconEffect.self
            case .setHeldItem:                  ServerPacket.Mojang.Java.Play.SetHeldItem.self
            case .programCommandBlock:          ServerPacket.Mojang.Java.Play.ProgramCommandBlock.self
            case .programCommandBlockMinecart:  ServerPacket.Mojang.Java.Play.ProgramCommandBlockMinecart.self
            case .setCreativeModeSlot:          ServerPacket.Mojang.Java.Play.SetCreativeMoveSlot.self
            case .programJigsawBlock:           ServerPacket.Mojang.Java.Play.ProgramJigsawBlock.self
            case .programStructureBlock:        ServerPacket.Mojang.Java.Play.ProgramStructureBlock.self
            case .updateSign:                   ServerPacket.Mojang.Java.Play.UpdateSign.self
            case .swingArm:                     ServerPacket.Mojang.Java.Play.SwingArm.self
            case .teleportToEntity:             ServerPacket.Mojang.Java.Play.TeleportToEntity.self
            case .useItemOn:                    ServerPacket.Mojang.Java.Play.UseItemOn.self
            case .useItem:                      ServerPacket.Mojang.Java.Play.UseItem.self
            }
        }
        
        @inlinable
        public func serverReceived(_ client: any MinecraftClientHandler) throws {
            try packet.serverReceived(client)
        }
    }
}
