//
//  BossBar.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol BossBar : Hashable {
    var title : String { get }
    var progress : Double { get }
    var color : Color { get }
}
