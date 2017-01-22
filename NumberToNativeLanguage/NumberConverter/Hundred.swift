//
//  Hundred.swift
//  NumberToNativeLanguage
//
//  Created by Serge Nanaev on 22.01.17.
//  Copyright © 2017 Serge Nanaev. All rights reserved.
//

import Foundation

internal enum Hundred: Int {
    case one    = 1
    case two    = 2
    case three  = 3
    case four   = 4
    case five   = 5
    case six    = 6
    case seven  = 7
    case eight  = 8
    case nine   = 9
    
    func getNativeLanguageName() -> String {
        switch (self) {
        case .one:      return "сто"
        case .two:      return "двести"
        case .three:    return "триста"
        case .four:     return "четыреста"
        case .five:     return "пятьсот"
        case .six:      return "шестьсот"
        case .seven:    return "семьсот"
        case .eight:    return "восемьсот"
        case .nine:     return "девятьсот"
        }
    }
}
