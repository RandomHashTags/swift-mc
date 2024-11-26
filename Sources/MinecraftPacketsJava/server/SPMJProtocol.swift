//
//  SPMJProtocol.swift
//  
//
//  Created by Evan Anderson on 8/2/23.
//

import MinecraftPackets

public protocol ServerPacketMojangJavaProtocol : ServerPacketProtocol, PacketMojangJava {
}

// MARK: ServerPacketMojangJavaHandshakingProtocol
public protocol ServerPacketMojangJavaHandshakingProtocol : ServerPacketMojangJavaProtocol where GameplayID == ServerPacket.Mojang.Java.Handshaking {
}
public extension ServerPacketMojangJavaHandshakingProtocol {
    static var packetGameplayID : GameplayID.Type {
        get {
            return ServerPacket.Mojang.Java.Handshaking.self
        }
    }
}
public extension ServerPacketMojangJavaHandshakingProtocol {
    var category : any PacketCategory {
        return PacketCategoryMojangJava.serverHandshaking
    }
}

// MARK: ServerPacketMojangJavaLoginProtocol
public protocol ServerPacketMojangJavaLoginProtocol : ServerPacketMojangJavaProtocol where GameplayID == ServerPacket.Mojang.Java.Login {
}
public extension ServerPacketMojangJavaLoginProtocol {
    static var packetGameplayID : GameplayID.Type {
        get {
            return ServerPacket.Mojang.Java.Login.self
        }
    }
}
public extension ServerPacketMojangJavaLoginProtocol {
    var category : any PacketCategory { PacketCategoryMojangJava.serverLogin }
}

// MARK: ServerPacketMojangJavaConfigurationProtocol
public protocol ServerPacketMojangJavaConfigurationProtocol : ServerPacketMojangJavaProtocol where GameplayID == ServerPacket.Mojang.Java.Configuration {
}
public extension ServerPacketMojangJavaConfigurationProtocol {
    static var packetGameplayID : GameplayID.Type {
        get {
            return ServerPacket.Mojang.Java.Configuration.self
        }
    }
}
public extension ServerPacketMojangJavaConfigurationProtocol {
    var category : any PacketCategory { PacketCategoryMojangJava.serverConfiguration }
}

// MARK: ServerPacketMojangJavaPlayProtocol
public protocol ServerPacketMojangJavaPlayProtocol : ServerPacketMojangJavaProtocol where GameplayID == ServerPacket.Mojang.Java.Play {
}
public extension ServerPacketMojangJavaPlayProtocol {
    static var packetGameplayID : GameplayID.Type {
        get {
            return ServerPacket.Mojang.Java.Play.self
        }
    }
}
public extension ServerPacketMojangJavaPlayProtocol {
    var category : any PacketCategory { PacketCategoryMojangJava.serverPlay }
}

// MARK: ServerPacketMojangJavaStatusProtocol
public protocol ServerPacketMojangJavaStatusProtocol : ServerPacketMojangJavaProtocol where GameplayID == ServerPacket.Mojang.Java.Status {
}
public extension ServerPacketMojangJavaStatusProtocol {
    static var packetGameplayID : GameplayID.Type {
        get {
            return ServerPacket.Mojang.Java.Status.self
        }
    }
}
public extension ServerPacketMojangJavaStatusProtocol {
    var category : any PacketCategory { PacketCategoryMojangJava.serverStatus }
}
