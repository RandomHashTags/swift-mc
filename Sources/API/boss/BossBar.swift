//
//  BossBar.swift
//  
//
//  Created by Evan Anderson on 2/5/23.
//

public protocol BossBar : Hashable {
    var title : String { get set }
    var progress : Double { get set }
    var color : Color { get set }
}
