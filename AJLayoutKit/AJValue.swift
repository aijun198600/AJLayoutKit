//
//  AJValue.swift
//  AJLayoutKit
//
//  Created by 肖爱军 on 2019/2/3.
//

import Foundation
import UIKit

public struct AJValue {
    var percent: AJPercent?
    var constant: CGFloat = 0.0
    var priority: Float = 1000
    var identifier: String?
    // use for change value
    weak var constraint: AJLayoutConstraint?
    
    public init(_ value:CGFloat) {
        self.constant = value
    }
    
    public init(_ value:CGFloat, percent: AJPercent) {
        self.constant = value
        self.percent = percent
    }
    
    public init(_ value:CGFloat, percent: AJPercent? = nil, priority: Float = 1000, identifier: String? = nil) {
        self.constant = value
        self.percent = percent
        self.priority = priority
        self.identifier = identifier
    }
}

public extension AJValue {
    public mutating func setPriority(_ priority: Float) {
        self.priority = priority
    }
    
    public mutating func setIdentifier(_ identifier: String?) {
        self.identifier = identifier
    }
    
    public mutating func setConstraint(_ constraint:AJLayoutConstraint?) {
        self.constraint = constraint
    }
    
    /** left.attribute = right.attribute * perent + constant
     *  ->
     *  right.attribute = (left.attribute - constant) / perent
     *  right.attribute = left.attribute * (1 / perent) - constant / perent
     **/
    public mutating func reverse() {
        if let percent = self.percent {
            if percent.value != 0 {
                self.constant = -self.constant
                self.percent = AJPercent(1.0 / percent.value)
            }else {
                self.constant = -self.constant
                self.percent = 1.0
            }
        }else {
            self.constant = -self.constant
        }
    }
}

extension AJValue: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        var str = ""
        if let per = self.percent {
            str = str + "\(per) + \(self.constant)"
        }else {
            str = str + "\(self.constant)"
        }
        str = str + " ~ \(self.priority)"
        if let identifier = self.identifier {
            str = str + " ^ " + identifier
        }
        return str
    }
    
    public var debugDescription: String {
        return self.description
    }
}

extension AJValue: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.init(CGFloat(value))
    }
}

extension AJValue: ExpressibleByFloatLiteral {
    public init(floatLiteral value: FloatLiteralType) {
        self.init(CGFloat(value))
    }
}

public func vw(_ value: Double) -> AJValue {
    let sw = UIScreen.main.bounds.size.width
    return AJValue(CGFloat(value) * sw / 100.0)
}

public func vh(_ value: Double) -> AJValue {
    let sh = UIScreen.main.bounds.size.height
    return AJValue(CGFloat(value) * sh / 100.0)
}

public func rpx(_ value: Double) -> AJValue {
    let sw = UIScreen.main.bounds.size.width
    return AJValue(CGFloat(value) * sw / 750.0)
}

