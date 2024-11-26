//
//  Attribute.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol Attribute : Nameable, Identifiable where ID == String {
    var baseValue : Double { get set }
    var description : String { get }
}
