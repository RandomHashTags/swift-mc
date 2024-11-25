//
//  MultilingualName.swift
//  
//
//  Created by Evan Anderson on 4/23/23.
//

import Foundation

public protocol MultilingualName {
    func name(for locale: Locale) -> String?
}
