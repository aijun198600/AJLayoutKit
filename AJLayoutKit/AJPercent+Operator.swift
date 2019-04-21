//
//  AJPercent+Operator.swift
//  AJLayoutKit
//
//  Created by 肖爱军 on 2019/2/3.
//

import Foundation

postfix operator %
public extension Int {
    static postfix func %(value: Int) -> AJPercent {
        return AJPercent.init(CGFloat(value) / 100.0)
    }
    
    static postfix func %(value: Int) -> AJValue {
        return AJValue.init(0, percent: value%)
    }
}

public extension Float {
    static postfix func %(value: Float) -> AJPercent {
        return AJPercent.init(CGFloat(value) / 100.0)
    }
    
    static postfix func %(value: Float) -> AJValue {
        return AJValue.init(0, percent: value%)
    }
}

public extension Double {
    static postfix func %(value: Double) -> AJPercent {
        return AJPercent.init(CGFloat(value) / 100.0)
    }
    
    static postfix func %(value: Double) -> AJValue {
        return AJValue.init(0, percent: value%)
    }
}

public extension CGFloat {
    static postfix func %(value: CGFloat) -> AJPercent {
        return AJPercent.init(value / 100.0)
    }
    
    static postfix func %(value: CGFloat) -> AJValue {
        return AJValue.init(0, percent: value%)
    }
}
