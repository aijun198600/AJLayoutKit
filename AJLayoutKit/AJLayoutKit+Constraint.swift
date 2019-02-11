//
//  AJLayoutKit+Constraint.swift
//  AJLayoutKit
//
//  Created by 肖爱军 on 2019/2/8.
//

import Foundation
import UIKit

public protocol AJLayoutElement {}

extension UIView: AJLayoutElement {}

public enum AJLayoutSide {
    case leading
    case trailing
    case top
    case bottom
}

extension AJLayoutSide: AJLayoutElement {}

public struct AJLayoutAttribute {
    var view: AJLayoutElement?
    var attribute: NSLayoutConstraint.Attribute = .notAnAttribute
    
    public init(){}
    
    public init(_ view: AJLayoutElement?, attribute: NSLayoutConstraint.Attribute) {
        self.view = view
        self.attribute = attribute
    }
}

public enum AJConstraintType {
    case normal   // use the normal constraint, v1 = v2 * multiplier + constant
    case chain    // use for chain constraint, like v1-(20% + 30)-v2, the chain view have same superview
    case side     // use for chain constraint, like |-(20% + 30)-v1, the constraint have AJLayoutSide
    case dimension  // use for dimension constraint, for .width and .height, left or right will be blank
}

public class AJLayoutConstraint {
    let left: AJLayoutAttribute
    var relation: NSLayoutConstraint.Relation = .equal
    let right: AJLayoutAttribute
    public var value: AJValue?
    public var layoutConstraints: [NSLayoutConstraint] = []
    public var type: AJConstraintType = .normal {
        didSet {
            if self.type == .chain {
                guard left.view is UIView && right.view is UIView && ((left.view as! UIView).superview == (right.view as! UIView).superview) else {
                    self.updateType()
                    return
                }
            }
        }
    }
    
    public init(left: AJLayoutAttribute, right: AJLayoutAttribute) {
        self.left = left
        self.right = right
        self.updateType()
    }
    
    public init(left: AJLayoutAttribute, right: AJLayoutAttribute, value:AJValue?) {
        self.left = left
        self.right = right
        self.value = value
        self.updateType()
    }
    
    public init(left: AJLayoutAttribute, right: AJLayoutAttribute, value:AJValue? = 0, relation: NSLayoutConstraint.Relation) {
        self.left = left
        self.right = right
        self.value = value
        self.relation = relation
        self.updateType()
    }
    
    public func updateType() {
        if self.left.view is AJLayoutSide || self.right.view is AJLayoutSide {
            self.type = .side
        }else if self.left.view == nil || self.right.view == nil {
            self.type = .dimension
        }else {
            self.type = .normal
        }
    }
    
    deinit {
        self.removeConstraints()
    }
}

