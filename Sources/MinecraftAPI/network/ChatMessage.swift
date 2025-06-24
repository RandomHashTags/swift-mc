//
//  ChatMessage.swift
//
//
//  Created by Evan Anderson on 6/30/23.
//

import Foundation

public protocol ChatMessage: MinecraftIdentifiable {
    var timestamp: Date { get }
    var sender: any CommandSender { get }
    var receiver: String? { get }
    var message: String { get }
}
