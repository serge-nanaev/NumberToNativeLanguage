//
//  NumberConverter.swift
//  NumberToNativeLanguage
//
//  Created by Serge Nanaev on 21.01.17.
//  Copyright © 2017 Serge Nanaev. All rights reserved.
//

import Foundation

public class NumberConverter {
    
    /**
     Публичный метод для конвертации.
     
     - parameter number:   Натуральное число которое необходимо конвертировать ( > 0)
     
     - returns: Строку на русском языке
     */
    public static func convert(number: Int) -> String {
        
        var tempNumber = number
        var divider = NCConstants.MAXIMUM_DIVIDER
        var resultArray: [String] = []
        
        while divider >= NCConstants.THOUSAND {
            
            let count = tempNumber / divider
            
            if count > 0 {
                resultArray.append(contentsOf: underThousand(number: count, divider: divider))
                if let modifier = getModifierName(forDivider: divider, count: count) {
                    resultArray.append(modifier)
                }
            }
            tempNumber = tempNumber % divider
            divider /= NCConstants.THOUSAND
        }
        
        resultArray.append(contentsOf: underThousand(number: tempNumber, divider: 0))
        
        return resultArray.joined(separator: NCConstants.SPACE)
    }
    
    /**
     Метод для преобразования чисел до 20
     
     - parameter forNumber: число, которое конвертируем
     - parameter divider: текущий делитель, необходимо для корректного склонения чисел 1 и 2.
                            т.к. с тысячами они склоняются иначе.
     
     - returns: Строку на русском языке
     */
    private static func getDigitName(forNumber number: Int, divider: Int) -> String? {
        guard let digit = Digit(rawValue: number) else { return nil }
        return digit.getNativeLanguageName(forDivider: divider)
    }
    
    /**
     Метод для преобразования десяток
     
     - parameter forNumber: количество десяток
     
     - returns: Строку на русском языке
     */
    private static func getTenName(forNumber number: Int) -> String? {
        guard let ten = Ten(rawValue: number) else { return nil }
        return ten.getNativeLanguageName()
    }
    
    /**
     Метод для преобразования сотен
     
     - parameter forNumber: количество сотен
     
     - returns: Строку на русском языке
     */
    private static func getHundredName(forNumber number: Int) -> String? {
        guard let hundred = Hundred(rawValue: number) else { return nil }
        return hundred.getNativeLanguageName()
    }
    
    /**
     Метод для получения модификатора: тысячи, миллионы и т.д
     
     - parameter forDivider: текущий делитель, в зависимости от него понимаем какой модификатор
     - parameter count: колличество тысяч, миллионов или других единиц, необходимо для правильного 
                        склонения
     
     - returns: Строку на русском языке
     */
    private static func getModifierName(forDivider divider: Int, count: Int) -> String? {
        guard let modifier = Modifier(rawValue: divider) else { return nil }
        return modifier.getNativeLanguageName(fromCount: count)
    }
    
    /**
     Метод для рассчета чисел порядка 1-999
     
     - parameter number: число
     - parameter divider: текущий делитель, для правильного склонения
     
     - returns: Массив строк на русском языке
     */
    private static func underThousand(number: Int, divider: Int) -> [String] {
        var result: [String] = []
        
        let hundreds = number / 100
        let underHundreds = number % 100
        
        if let hundreedString = getHundredName(forNumber: hundreds) {
            result.append(hundreedString)
        }
        
        if underHundreds < NCConstants.MAX_DIGIT_LENGHT {
            if let underHundreedsString = getDigitName(forNumber: underHundreds, divider: divider) {
                result.append(underHundreedsString)
            }
        } else {
            let tens = underHundreds / 10
            let digits = underHundreds % 10
            if let underHundreedsString = getTenName(forNumber: tens) {
                result.append(underHundreedsString)
            }
            if let underHundreedsString = getDigitName(forNumber: digits, divider: divider) {
                result.append(underHundreedsString)
            }
        }
        return result
    }
}
