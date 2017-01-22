//
//  Modifier.swift
//  NumberToNativeLanguage
//
//  Created by Serge Nanaev on 22.01.17.
//  Copyright © 2017 Serge Nanaev. All rights reserved.
//

import Foundation

enum Modifier: Int {
    case thousand       = 1000
    case million        = 1000000
    case billion        = 1000000000
    case trillion       = 1000000000000
    case quadrillion    = 1000000000000000
    case quintillion    = 1000000000000000000
    
    func getNativeLanguageName(fromCount count: Int) -> String {
        let titles = self.titles
        return titles[ (count % 100 > 4 && count % 100 < 20) ? 2 : NCConstants.MODIFIER_CASES[ (count % 10 < 5) ? count % 10 : 5 ] ]
    }
    
    private var titles: [String] {
        switch self {
        case .thousand:
            return ["тысяча", "тысячи", "тысяч"]
        case .million:
            return ["миллион", "миллиона", "миллионов"]
        case .billion:
            return ["миллиард", "миллиарда", "миллиардов"]
        case .trillion:
            return ["триллион", "триллиона", "триллионов"]
        case .quadrillion:
            return ["квадрилион", "квадрилиона", "квадрилионов"]
        case .quintillion:
            return ["квантилион", "квантилиона", "квантилионов"]
        }
    }
}
