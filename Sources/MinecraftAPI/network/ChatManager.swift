//
//  ChatManager.swift
//
//
//  Created by Evan Anderson on 6/30/23.
//

public protocol ChatManager: Actor {
    func send(sender: any CommandSender, receiver: String?, message: String) async
}
