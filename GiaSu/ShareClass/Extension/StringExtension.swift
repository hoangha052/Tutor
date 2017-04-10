//
//  StringExtension.swift
//  Tinry
//
//  Created by hoangha052 on 10/24/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation

extension String {
    
    static func convertDoubleValue(_ value: Double) -> String
    {
        let fmt = NumberFormatter()
        fmt.numberStyle = .currency
        let numberValue = NSNumber(value: value as Double)
        fmt.locale = Locale.current
        fmt.maximumFractionDigits = 0
        return fmt.string(from: numberValue)!
    }
    
    static func convertStringtoDouble(_ value: String) -> Double {
        let fmt = NumberFormatter()
        fmt.locale = Locale.current
        return fmt.number(from: value) as! Double
    }
}
