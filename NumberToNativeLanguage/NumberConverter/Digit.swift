//
//  Digit.swift
//  NumberToNativeLanguage
//
//  Created by Serge Nanaev on 22.01.17.
//  Copyright © 2017 Serge Nanaev. All rights reserved.
//

import Foundation

internal enum Digit: Int {
    case one        = 1
    case two        = 2
    case three      = 3
    case four       = 4
    case five       = 5
    case six        = 6
    case seven      = 7
    case eight      = 8
    case nine       = 9
    case ten        = 10
    case eleven     = 11
    case twelve     = 12
    case thirteen   = 13
    case fourteen   = 14
    case fifteen    = 15
    case sixteen    = 16
    case seventeen  = 17
    case eighteen   = 18
    case nineteen   = 19
    
    
    func getNativeLanguageName(forDivider divider: Int) -> String {
        switch (self) {
        case .one:      return divider == NCConstants.THOUSAND ? "одна" : "один"
        case .two:      return divider == NCConstants.THOUSAND ? "две" : "два"
        case .three:    return "три"
        case .four:     return "четыре"
        case .five:     return "пять"
        case .six:      return "шесть"
        case .seven:    return "семь"
        case .eight:    return "восемь"
        case .nine:     return "девять"
        case .ten:      return "десять"
        case .eleven:   return "одинадцать"
        case .twelve:   return "двенадцать"
        case .thirteen: return "тринадцать"
        case .fourteen: return "четырнадцать"
        case .fifteen:  return "пятнадцать"
        case .sixteen:  return "шестнадцать"
        case .seventeen: return "семнадцать"
        case .eighteen: return "восемнадцать"
        case .nineteen: return "девятнадцать"
        }
    }
}
