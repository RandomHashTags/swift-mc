//
//  Command.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol Command : Hashable, Identifiable where ID == String {
    var label : String { get }
    var description : String { get }
    var aliases : Set<String> { get }
    var permission : any Permission { get }
    var permissionMessage : String { get }
    
    func execute(_ sender: any CommandSender)
    func get_options(_ sender: any CommandSender, index: Int) -> [String]
}
