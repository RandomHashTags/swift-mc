//
//  Sound.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol Sound : Identifiable, Nameable where ID == String {
    var categoryID : String { get }
}
