//
//  AJLayoutKit+Attribute.swift
//  AJLayoutKit
//
//  Created by 肖爱军 on 2019/2/8.
//

import Foundation
import UIKit

public extension UIView {
    public var Width: AJLayoutAttribute {
        return AJLayoutAttribute(self, attribute: .width)
    }
    
    public var Height: AJLayoutAttribute {
        return AJLayoutAttribute(self, attribute: .height)
    }
    
    public var Top: AJLayoutAttribute {
        return AJLayoutAttribute(self, attribute: .top)
    }
    
    public var Bottom: AJLayoutAttribute {
        return AJLayoutAttribute(self, attribute: .bottom)
    }
    
    public var Left: AJLayoutAttribute {
        return AJLayoutAttribute(self, attribute: .left)
    }
    
    public var Right: AJLayoutAttribute {
        return AJLayoutAttribute(self, attribute: .right)
    }
    
    public var Leading: AJLayoutAttribute {
        return AJLayoutAttribute(self, attribute: .leading)
    }
    
    public var Trailing: AJLayoutAttribute {
        return AJLayoutAttribute(self, attribute: .trailing)
    }
    
    public var CenterX: AJLayoutAttribute {
        return AJLayoutAttribute(self, attribute: .centerX)
    }
    
    public var CenterY: AJLayoutAttribute {
        return AJLayoutAttribute(self, attribute: .centerY)
    }
    
    public var FirstBaseline: AJLayoutAttribute {
        return AJLayoutAttribute(self, attribute: .firstBaseline)
    }
    
    public var LastBaseline: AJLayoutAttribute {
        return AJLayoutAttribute(self, attribute: .lastBaseline)
    }
}

@discardableResult
public func == (left: AJLayoutAttribute, right: AJLayoutAttribute) -> AJLayoutConstraint {
    return AJLayoutConstraint(left: left, right: right)
}

// view1.width == view2.width * 0.3 + 15
@discardableResult
public func ==(left: AJLayoutAttribute, right: AJLayoutChain) -> AJLayoutConstraint {
    return AJLayoutConstraint(left: left, right: right.attribute, value: right.value)
}

@discardableResult
public func ==(left: AJLayoutChain, right: AJLayoutAttribute) -> AJLayoutConstraint {
    return AJLayoutConstraint(left: left.attribute, right: right, value: left.value)
}

@discardableResult
public func ==(left: AJLayoutAttribute, right: AJValue) -> AJLayoutConstraint {
    let canNilAttributes: [NSLayoutConstraint.Attribute] = [.width, .height]
    var rightAttribute: AJLayoutAttribute
    if right.percent != nil || !canNilAttributes.contains(left.attribute) {
        if let v = left.view as? UIView {
            rightAttribute = AJLayoutAttribute(v.superview, attribute: left.attribute)
        }else if let g = left.view as? UILayoutGuide {
            rightAttribute = AJLayoutAttribute(g.owningView, attribute: left.attribute)
        } else {
            rightAttribute = AJLayoutAttribute()
        }
    }else {
        rightAttribute = AJLayoutAttribute()
    }
    
    return AJLayoutConstraint(left: left, right: rightAttribute, value: right)
}

//  view1.width == view2, equal to : view1.width == view2.width
@discardableResult
public func ==(left: AJLayoutAttribute, right: UIView) -> AJLayoutConstraint {
    return AJLayoutConstraint(left: left, right: AJLayoutAttribute(right, attribute: left.attribute), value: 0)
}

infix operator >=
@discardableResult
public func >= (left: AJLayoutAttribute, right: AJLayoutAttribute) -> AJLayoutConstraint {
    return AJLayoutConstraint(left: left, right: right, value: nil, relation: .greaterThanOrEqual)
}

@discardableResult
public func >= (left: AJLayoutAttribute, right: AJLayoutChain) -> AJLayoutConstraint {
    return AJLayoutConstraint(left: left, right: right.attribute, value: right.value, relation: .greaterThanOrEqual)
}

@discardableResult
public func >= (left: AJLayoutChain, right: AJLayoutAttribute) -> AJLayoutConstraint {
    return AJLayoutConstraint(left: left.attribute, right: right, value: left.value, relation: .greaterThanOrEqual)
}

@discardableResult
public func >= (left: AJLayoutAttribute, right: AJValue) -> AJLayoutConstraint {
    let canNilAttributes: [NSLayoutConstraint.Attribute] = [.width, .height]
    var rightAttribute: AJLayoutAttribute
    if right.percent != nil || !canNilAttributes.contains(left.attribute) {
        if let v = left.view as? UIView {
            rightAttribute = AJLayoutAttribute(v.superview, attribute: left.attribute)
        }else if let g = left.view as? UILayoutGuide {
            rightAttribute = AJLayoutAttribute(g.owningView, attribute: left.attribute)
        } else {
            rightAttribute = AJLayoutAttribute()
        }
    }else {
        rightAttribute = AJLayoutAttribute()
    }
    
    return AJLayoutConstraint(left: left, right: rightAttribute, value: right, relation: .greaterThanOrEqual)
}

@discardableResult
public func >= (left: AJLayoutAttribute, right: UIView) -> AJLayoutConstraint {
    return AJLayoutConstraint(left: left, right: AJLayoutAttribute(right, attribute: left.attribute), value: 0, relation: .greaterThanOrEqual)
}

infix operator <=
@discardableResult
public func <= (left: AJLayoutAttribute, right: AJLayoutAttribute) -> AJLayoutConstraint {
    return AJLayoutConstraint(left: left, right: right, value: nil, relation: .lessThanOrEqual)
}

@discardableResult
public func <= (left: AJLayoutAttribute, right: AJLayoutChain) -> AJLayoutConstraint {
    return AJLayoutConstraint(left: left, right: right.attribute, value: right.value, relation: .lessThanOrEqual)
}

@discardableResult
public func <= (left: AJLayoutChain, right: AJLayoutAttribute) -> AJLayoutConstraint {
    return AJLayoutConstraint(left: left.attribute, right: right, value: left.value, relation: .lessThanOrEqual)
}

@discardableResult
public func <= (left: AJLayoutAttribute, right: AJValue) -> AJLayoutConstraint {
    let canNilAttributes: [NSLayoutConstraint.Attribute] = [.width, .height]
    var rightAttribute: AJLayoutAttribute
    if right.percent != nil || !canNilAttributes.contains(left.attribute) {
        if let v = left.view as? UIView {
            rightAttribute = AJLayoutAttribute(v.superview, attribute: left.attribute)
        }else if let g = left.view as? UILayoutGuide {
            rightAttribute = AJLayoutAttribute(g.owningView, attribute: left.attribute)
        } else {
            rightAttribute = AJLayoutAttribute()
        }
    }else {
        rightAttribute = AJLayoutAttribute()
    }
    
    return AJLayoutConstraint(left: left, right: rightAttribute, value: right, relation: .lessThanOrEqual)
}

@discardableResult
public func <= (left: AJLayoutAttribute, right: UIView) -> AJLayoutConstraint {
    return AJLayoutConstraint(left: left, right: AJLayoutAttribute(right, attribute: left.attribute), value: 0, relation: .lessThanOrEqual)
}

@discardableResult
public func *(left: AJLayoutAttribute, right: CGFloat) -> AJLayoutChain {
    return AJLayoutChain(attribute: left, value: (right * 100.0)%)
}

public func - (left: AJLayoutAttribute, right: CGFloat) -> AJLayoutChain {
    return AJLayoutChain(attribute: left, value: AJValue(-right))
}

public func + (left: AJLayoutAttribute, right: CGFloat) -> AJLayoutChain {
    return AJLayoutChain(attribute: left, value: AJValue(right))
}

@discardableResult
public func - (left: AJLayoutChain, right: CGFloat) -> AJLayoutChain {
    if let value = left.value, let percent = value.percent {
        left.value = AJValue(-right, percent: percent)
    }else {
        left.value = AJValue(-right)
    }
    return left
}

@discardableResult
public func +(left: AJLayoutChain, right: CGFloat) -> AJLayoutChain {
    if let value = left.value, let percent = value.percent {
        left.value = AJValue(right, percent: percent)
    }else {
        left.value = AJValue(right)
    }
    return left
}

@discardableResult
public func ~ (left: AJLayoutChain, right: Float) -> AJLayoutChain {
    if let value = left.value {
        left.value = AJValue(value.constant, percent: value.percent, priority: right)
    }else {
        left.value = AJValue(0, percent: nil, priority: right)
    }
    return left
}

