//
//  AJValue+Operator.swift
//  AJLayoutKit
//
//  Created by 肖爱军 on 2019/2/8.
//

import Foundation

@discardableResult
public func + (left: AJPercent, right: CGFloat) -> AJValue {
    return AJValue(right, percent: left)
}

@discardableResult
public func - (left: AJPercent, right: CGFloat) -> AJValue {
    return AJValue(-right, percent: left)
}

// MARK: Set Priority
//precedencegroup AJPriorityPrecedence {
//    higherThan: NilCoalescingPrecedence
//    lowerThan: AdditionPrecedence
//    associativity: right
//}
//
//infix operator ~ : AJPriorityPrecedence
infix operator ~ : AdditionPrecedence
@discardableResult
public func ~ (left: AJValue, right: Float) -> AJValue {
    var value = left
    value.setPriority(right)
    return value
}

@discardableResult
public func ~ (left: AJValue, right: Int) -> AJValue {
    var value = left
    value.setPriority(Float(right))
    return value
}

@discardableResult
public func ~ (left: AJValue, right: String) -> AJValue {
    var value = left
    value.setIdentifier(right)
    return value
}

infix operator ^ : AdditionPrecedence
@discardableResult
public func ^ (left: AJValue, right: String) -> AJValue {
    var value = left
    value.setIdentifier(right)
    return value
}

//infix operator <> : AdditionPrecedence
//@discardableResult
//public func <> (left: AJValue, right: AJValue?) -> AJValue {
//    right = left
//    return left
//}
