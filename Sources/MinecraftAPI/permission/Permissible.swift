//
//  Permissible.swift
//
//
//  Created by Evan Anderson on 6/30/23.
//

public protocol Permissible : Hashable {
    var permissions : Set<String> { get }
}

public extension Permissible {
    func hasPermission(_ permission: String) -> Bool { permissions.contains(permission) }
}
