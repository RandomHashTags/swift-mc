
import MinecraftPackets

public protocol ClientPacketMojangJavaProtocol: ClientPacketProtocol, PacketMojangJava {
}

// MARK: ClientPacketMojangJavaStatusProtocol
public protocol ClientPacketMojangJavaStatusProtocol: ClientPacketMojangJavaProtocol where GameplayID == ClientPacket.Mojang.Java.Status {
}
extension ClientPacketMojangJavaStatusProtocol {
    @inlinable
    public static var packetGameplayID: GameplayID.Type {
        ClientPacket.Mojang.Java.Status.self
    }
}
extension ClientPacketMojangJavaStatusProtocol {
    @inlinable
    public var category: any PacketCategory {
        PacketCategoryMojangJava.clientHandshaking
    }
}

// MARK: ClientPacketMojangJavaLoginProtocol
public protocol ClientPacketMojangJavaLoginProtocol: ClientPacketMojangJavaProtocol where GameplayID == ClientPacket.Mojang.Java.Login {
}
extension ClientPacketMojangJavaLoginProtocol {
    @inlinable
    public static var packetGameplayID: GameplayID.Type {
        ClientPacket.Mojang.Java.Login.self
    }
}
extension ClientPacketMojangJavaLoginProtocol {
    @inlinable
    public var category: any PacketCategory {
        PacketCategoryMojangJava.clientLogin
    }
}

// MARK: ClientPacket.Mojang.Java.ConfigurationProtocol
extension ClientPacket.Mojang.Java {
    public protocol ConfigurationProtocol: ClientPacketMojangJavaProtocol where GameplayID == ClientPacket.Mojang.Java.Configuration {
    }
}
extension ClientPacket.Mojang.Java.ConfigurationProtocol {
    @inlinable
    public static var packetGameplayID: GameplayID.Type {
        get {
            return ClientPacket.Mojang.Java.Configuration.self
        }
    }
}
extension ClientPacket.Mojang.Java.ConfigurationProtocol {
    @inlinable
    public var category: any PacketCategory {
        PacketCategoryMojangJava.clientConfiguration
    }
}

// MARK: ClientPacket.Mojang.Java.PlayProtocol
extension ClientPacket.Mojang.Java {
    public protocol PlayProtocol: ClientPacketMojangJavaProtocol where GameplayID == ClientPacket.Mojang.Java.Play {
    }
}

extension ClientPacket.Mojang.Java.PlayProtocol {
    @inlinable
    public static var packetGameplayID: GameplayID.Type {
        ClientPacket.Mojang.Java.Play.self
    }
}
extension ClientPacket.Mojang.Java.PlayProtocol {
    @inlinable
    public var category: any PacketCategory {
        PacketCategoryMojangJava.clientPlay
    }
}
