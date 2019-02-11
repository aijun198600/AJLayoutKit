//
//  AJLayoutKit+Operator.swift
//  AJLayoutKit
//
//  Created by 肖爱军 on 2019/2/9.
//

import Foundation
import UIKit


prefix operator |-
public prefix func |- (value: AJValue) -> AJLayoutContainer {
    let attribute = AJLayoutAttribute(AJLayoutSide.leading, attribute: .leading)
    let chain = AJLayoutChain(attribute: attribute, value: value)
    let container = AJLayoutContainer(chain: chain, direct: .horizontal)
    return container
}

public prefix func |- (view: UIView) -> AJLayoutContainer {
    let left = AJLayoutAttribute(AJLayoutSide.leading, attribute: .leading)
    let right = AJLayoutAttribute(view, attribute: .leading)
    let constraint = AJLayoutConstraint(left: left, right: right)
    constraint.type = .chain
    // default chain become the right view
    let chain = AJLayoutChain(attribute: AJLayoutAttribute(view, attribute: .trailing))
    let container = AJLayoutContainer(chain: chain, direct: .horizontal)
    container.constraints.append(constraint)
    return container
}

public prefix func |- (container: AJLayoutContainer) -> AJLayoutContainer {
    
    let chain = container.chain
    let left = AJLayoutAttribute(AJLayoutSide.leading, attribute: .leading)
    let constraint = AJLayoutConstraint(left: left, right: chain.attribute, value: chain.value)
    constraint.type = .chain
    container.constraints.append(constraint)
    container.constraints.reverse()
    return container
}

prefix operator ||
public prefix func || (view: UIView) -> AJLayoutContainer {
    let chain = AJLayoutChain(attribute: AJLayoutAttribute(view, attribute: .trailing))
    let constraints = AJLayoutContainer(chain: chain, direct: .horizontal)
    return constraints
}

postfix operator -|
public postfix func -| (value: AJValue) -> AJLayoutContainer {
    let attribute = AJLayoutAttribute(AJLayoutSide.trailing, attribute: .trailing)
    let chain = AJLayoutChain(attribute: attribute, value: value)
    let constraints = AJLayoutContainer(chain: chain, direct: .horizontal)
    return constraints
}

public postfix func -| (view: UIView) -> AJLayoutContainer {
    let right = AJLayoutAttribute(AJLayoutSide.trailing, attribute: .trailing)
    let left = AJLayoutAttribute(view, attribute: .trailing)
    let constraint = AJLayoutConstraint(left: left, right: right)
    constraint.type = .chain
    // default chain become the left view
    let chain = AJLayoutChain(attribute: AJLayoutAttribute(view, attribute: .leading))
    let constraints = AJLayoutContainer(chain: chain, direct: .horizontal)
    constraints.constraints.append(constraint)
    return constraints
}

prefix operator &-
public prefix func &- (value: AJValue) -> AJLayoutContainer {
    let attribute = AJLayoutAttribute(AJLayoutSide.top, attribute: .top)
    let chain = AJLayoutChain(attribute: attribute, value: value)
    let constraints = AJLayoutContainer(chain: chain, direct: .vertical)
    return constraints
}

public prefix func &- (view: UIView) -> AJLayoutContainer {
    let left = AJLayoutAttribute(AJLayoutSide.top, attribute: .top)
    let right = AJLayoutAttribute(view, attribute: .top)
    let constraint = AJLayoutConstraint(left: left, right: right)
    constraint.type = .chain
    let chain = AJLayoutChain(attribute: AJLayoutAttribute(view, attribute: .bottom))
    let constraints = AJLayoutContainer(chain: chain, direct: .vertical)
    constraints.constraints.append(constraint)
    return constraints
}

public prefix func &- (container: AJLayoutContainer) -> AJLayoutContainer {
    
    let chain = container.chain
    let left = AJLayoutAttribute(AJLayoutSide.top, attribute: .top)
    let constraint = AJLayoutConstraint(left: left, right: chain.attribute, value: chain.value)
    constraint.type = .chain
    container.constraints.append(constraint)
    container.constraints.reverse()
    return container
}

postfix operator -&
public postfix func -& (value: AJValue) -> AJLayoutContainer {
    let attribute = AJLayoutAttribute(AJLayoutSide.bottom, attribute: .bottom)
    let chain = AJLayoutChain(attribute: attribute, value: value)
    let constraints = AJLayoutContainer(chain: chain, direct: .vertical)
    return constraints
}

public postfix func -& (view: UIView) -> AJLayoutContainer {
    let right = AJLayoutAttribute(AJLayoutSide.bottom, attribute: .bottom)
    let left = AJLayoutAttribute(view, attribute: .bottom)
    let constraint = AJLayoutConstraint(left: left, right: right)
    constraint.type = .chain
    // default chain become the top view
    let chain = AJLayoutChain(attribute: AJLayoutAttribute(view, attribute: .top))
    let constraints = AJLayoutContainer(chain: chain, direct: .vertical)
    constraints.constraints.append(constraint)
    return constraints
}

prefix operator &&
public prefix func && (view: UIView) -> AJLayoutContainer {
    let chain = AJLayoutChain(attribute: AJLayoutAttribute(view, attribute: .bottom))
    let constraints = AJLayoutContainer(chain: chain, direct: .vertical)
    return constraints
}


public func - (left: AJLayoutContainer, right: UIView) -> AJLayoutContainer {
    let chain = left.chain
    let rightAttribute: AJLayoutAttribute
    let nextAttribute: AJLayoutAttribute
    if left.direct == .horizontal {
        rightAttribute = AJLayoutAttribute(right, attribute: .leading)
        nextAttribute = AJLayoutAttribute(right, attribute: .trailing)
    }else {
        rightAttribute = AJLayoutAttribute(right, attribute: .top)
        nextAttribute = AJLayoutAttribute(right, attribute: .bottom)
    }
    let constraint = AJLayoutConstraint(left: chain.attribute, right: rightAttribute, value: chain.value)
    constraint.type = .chain
    left.constraints.append(constraint)
    left.chain = AJLayoutChain(attribute: nextAttribute)
    return left
}

public func - (left: AJLayoutContainer, right: AJValue) -> AJLayoutContainer {
    left.chain.value = right
    return left
}

public func - (left: AJLayoutContainer, right: AJLayoutContainer) -> AJLayoutContainer {
    
    if (left.direct == right.direct) {
        let leftChain = left.chain
        let rightChain = right.chain
        var value: AJValue?
        if let v = leftChain.value {
            value = v
        }else if let v = rightChain.value {
            value = v
        }
        let constraint = AJLayoutConstraint(left: leftChain.attribute, right: rightChain.attribute, value: value)
        constraint.type = .chain
        left.constraints.append(constraint)
        if right.constraints.count > 0 {
            right.constraints.reverse()
            left.constraints += right.constraints
        }
    }else {
        fatalError("Can't combine the different direction constraint")
    }
    return left
}



