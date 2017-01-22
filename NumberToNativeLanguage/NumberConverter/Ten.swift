//
//  Ten.swift
//  NumberToNativeLanguage
//
//  Created by Serge Nanaev on 22.01.17.
//  Copyright © 2017 Serge Nanaev. All rights reserved.
//

import Foundation

internal enum Ten: Int {
    case ten    = 1
    case twenty = 2
    case thirty = 3
    case forty  = 4
    case fifty  = 5
    case sixty  = 6
    case seventy = 7
    case eighty = 8
    case ninety = 9
    
    func getNativeLanguageName() -> String {
        switch (self) {
        case .ten:      return "десять"
        case .twenty:   return "двадцать"
        case .thirty:   return "тридцать"
        case .forty:    return "сорок"
        case .fifty:    return "пятьдесят"
        case .sixty:    return "шестьдесят"
        case .seventy:  return "семьдесят"
        case .eighty:   return "восемьдесят"
        case .ninety:   return "девяносто"
        }
    }
}
