import MinecraftPackets

public protocol ClientPacketMojangJavaProtocol: ClientPacketProtocol, PacketMojangJava {
}

// MARK: ClientPacketMojangJavaStatusProtocol
public protocol ClientPacketMojangJavaStatusProtocol: ClientPacketMojangJavaProtocol where GameplayID == ClientPacket.Mojang.Java.Status {
}
public extension ClientPacketMojangJavaStatusProtocol {
    static var packetGameplayID: GameplayID.Type {
        get {
            return ClientPacket.Mojang.Java.Status.self
        }
    }
}
public extension ClientPacketMojangJavaStatusProtocol {
    var category: any PacketCategory { PacketCategoryMojangJava.clientHandshaking }
}

// MARK: ClientPacketMojangJavaLoginProtocol
public protocol ClientPacketMojangJavaLoginProtocol: ClientPacketMojangJavaProtocol where GameplayID == ClientPacket.Mojang.Java.Login {
}
public extension ClientPacketMojangJavaLoginProtocol {
    static var packetGameplayID: GameplayID.Type {
        get {
            return ClientPacket.Mojang.Java.Login.self
        }
    }
}
public extension ClientPacketMojangJavaLoginProtocol {
    var category: any PacketCategory { PacketCategoryMojangJava.clientLogin }
}

// MARK: ClientPacket.Mojang.Java.ConfigurationProtocol
public extension ClientPacket.Mojang.Java {
    protocol ConfigurationProtocol: ClientPacketMojangJavaProtocol where GameplayID == ClientPacket.Mojang.Java.Configuration {
    }
}
public extension ClientPacket.Mojang.Java.ConfigurationProtocol {
    static var packetGameplayID: GameplayID.Type {
        get {
            return ClientPacket.Mojang.Java.Configuration.self
        }
    }
}
public extension ClientPacket.Mojang.Java.ConfigurationProtocol {
    var category: any PacketCategory { PacketCategoryMojangJava.clientConfiguration }
}

// MARK: ClientPacket.Mojang.Java.PlayProtocol
public extension ClientPacket.Mojang.Java {
    protocol PlayProtocol: ClientPacketMojangJavaProtocol where GameplayID == ClientPacket.Mojang.Java.Play {
    }
}

public extension ClientPacket.Mojang.Java.PlayProtocol {
    static var packetGameplayID: GameplayID.Type {
        get {
            return ClientPacket.Mojang.Java.Play.self
        }
    }
}
public extension ClientPacket.Mojang.Java.PlayProtocol {
    var category: any PacketCategory { PacketCategoryMojangJava.clientPlay }
}
