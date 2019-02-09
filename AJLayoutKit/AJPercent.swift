//
//  AJPercent.swift
//  AJLayoutKit
//
//  Created by 肖爱军 on 2019/2/3.
//

import Foundation

public struct AJPercent {
    var value: CGFloat
    
    public init(_ value: CGFloat) {
        self.value = value
    }
}

extension AJPercent: CustomStringConvertible {
    public var description: String {
        return "\(self.value * 100)%"
    }
}

extension AJPercent: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.init(CGFloat(value))
    }
}

extension AJPercent: ExpressibleByFloatLiteral {
    public init(floatLiteral value: FloatLiteralType) {
        self.init(CGFloat(value))
    }
}

extension AJPercent: ExpressibleByStringLiteral {
    
    public init(string value: StringLiteralType) {
        if value.hasSuffix("%") {
            let str = value[0..<value.count - 1]
            if let floatValue = Float(str) {
                self.init( CGFloat(floatValue) / 100.0)
            }else {
                self.init(0)
            }
        }else if let floatValue = Float(value) {
            self.init(CGFloat(floatValue))
        }else {
            self.init(0)
        }
    }
    
    public init(stringLiteral value: StringLiteralType) {
        self.init(string: value)
    }
    
    public init(extendedGraphemeClusterLiteral value: StringLiteralType) {
        self.init(string: value)
    }
    
    public init(unicodeScalarLiteral value: StringLiteralType) {
        self.init(string: value)
    }
}
