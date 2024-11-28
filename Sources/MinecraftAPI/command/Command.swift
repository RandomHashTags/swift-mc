//
//  Command.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol Command : MinecraftIdentifiable {
    var label : String { get }
    var description : String { get }
    var usage : String { get }

    var aliases : Set<String> { get }
    var permission : any Permission { get }
    
    /// - Returns: Whether or not the command was successfully executed by the sender.
    func execute(sender: any CommandSender, arguments: [String]) -> Bool
    /// - Returns: A list of the available completions based on the sender's arguments.
    func tabComplete(sender: any CommandSender, arguments: [String]) -> [String]
}
