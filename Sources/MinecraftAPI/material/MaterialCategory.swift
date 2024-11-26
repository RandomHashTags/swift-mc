//
//  MaterialCategory.swift
//  
//
//  Created by Evan Anderson on 2/3/23.
//

public protocol MaterialCategory : Hashable, Identifiable, Nameable where ID == String {
    var configurationID : String { get }
    var configuration : (any MaterialConfiguration)? { get }
}

public extension MaterialCategory {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
