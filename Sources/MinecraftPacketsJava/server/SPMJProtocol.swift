
import MinecraftPackets

public protocol ServerPacketMojangJavaProtocol: ServerPacketProtocol, PacketMojangJava {
}

// MARK: ServerPacketMojangJavaHandshakingProtocol
public protocol ServerPacketMojangJavaHandshakingProtocol: ServerPacketMojangJavaProtocol where GameplayID == ServerPacket.Mojang.Java.Handshaking {
}
extension ServerPacketMojangJavaHandshakingProtocol {
    @inlinable
    public static var packetGameplayID: GameplayID.Type {
        ServerPacket.Mojang.Java.Handshaking.self
    }
}
extension ServerPacketMojangJavaHandshakingProtocol {
    @inlinable
    public var category: any PacketCategory {
        PacketCategoryMojangJava.serverHandshaking
    }
}

// MARK: ServerPacketMojangJavaLoginProtocol
public protocol ServerPacketMojangJavaLoginProtocol: ServerPacketMojangJavaProtocol where GameplayID == ServerPacket.Mojang.Java.Login {
}
extension ServerPacketMojangJavaLoginProtocol {
    @inlinable
    public static var packetGameplayID: GameplayID.Type {
        ServerPacket.Mojang.Java.Login.self
    }
}
extension ServerPacketMojangJavaLoginProtocol {
    @inlinable
    public var category: any PacketCategory {
        PacketCategoryMojangJava.serverLogin
    }
}

// MARK: ServerPacketMojangJavaConfigurationProtocol
public protocol ServerPacketMojangJavaConfigurationProtocol: ServerPacketMojangJavaProtocol where GameplayID == ServerPacket.Mojang.Java.Configuration {
}
extension ServerPacketMojangJavaConfigurationProtocol {
    @inlinable
    public static var packetGameplayID: GameplayID.Type {
        ServerPacket.Mojang.Java.Configuration.self
    }
}
extension ServerPacketMojangJavaConfigurationProtocol {
    @inlinable
    public var category: any PacketCategory {
        PacketCategoryMojangJava.serverConfiguration
    }
}

// MARK: ServerPacketMojangJavaPlayProtocol
public protocol ServerPacketMojangJavaPlayProtocol: ServerPacketMojangJavaProtocol where GameplayID == ServerPacket.Mojang.Java.Play {
}
extension ServerPacketMojangJavaPlayProtocol {
    @inlinable
    public static var packetGameplayID: GameplayID.Type {
        ServerPacket.Mojang.Java.Play.self
    }
}
extension ServerPacketMojangJavaPlayProtocol {
    @inlinable
    public var category: any PacketCategory {
        PacketCategoryMojangJava.serverPlay
    }
}

// MARK: ServerPacketMojangJavaStatusProtocol
public protocol ServerPacketMojangJavaStatusProtocol: ServerPacketMojangJavaProtocol where GameplayID == ServerPacket.Mojang.Java.Status {
}
extension ServerPacketMojangJavaStatusProtocol {
    @inlinable
    public static var packetGameplayID: GameplayID.Type {
        ServerPacket.Mojang.Java.Status.self
    }
}
extension ServerPacketMojangJavaStatusProtocol {
    @inlinable
    public var category: any PacketCategory {
        PacketCategoryMojangJava.serverStatus
    }
}
