//
//  Sound.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol Sound : Identifiable, MultilingualName {
    var categoryID : String { get }
}
