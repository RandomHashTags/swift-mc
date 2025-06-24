//
//  CommandSender.swift
//
//
//  Created by Evan Anderson on 6/30/23.
//

public protocol CommandSender {
    var name: String { get }
    
    func send(message: String) async
}
