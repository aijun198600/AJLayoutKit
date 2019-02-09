//
//  String+IntSubscript.swift
//  AJLayoutKit
//
//  Created by 肖爱军 on 2019/2/3.
//

import Foundation

extension String {
    
    internal subscript(_ range: CountableRange<Int>) -> String {
        let idx1 = index(startIndex, offsetBy: max(0, range.lowerBound))
        let idx2 = index(startIndex, offsetBy: min(self.count, range.upperBound))
        return String(self[idx1..<idx2])
    }
    
}
