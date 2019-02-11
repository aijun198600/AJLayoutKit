//
//  AJLayoutKit+RemoveConstraints.swift
//  AJLayoutKit
//
//  Created by 肖爱军 on 2019/2/8.
//

import Foundation
import UIKit

public extension AJLayoutConstraint {
    // remove constraints and custom UILayoutGuide
    public func removeConstraints() {
        for constraint in layoutConstraints {
            var guide: UILayoutGuide?
            if let v = constraint.firstItem as? UILayoutGuide {
                guide = v
            }else if let v = constraint.firstItem as? UILayoutGuide {
                guide = v
            }
            
            if let g = guide, let v = g.owningView, g.identifier.hasPrefix("AJLayoutKit") {
                v.removeLayoutGuide(g)
            }
            constraint.owningView?.removeConstraint(constraint)
        }
        self.layoutConstraints = []
    }
}

public extension AJLayoutConstraint {
    public var owningView: UIView? {
        return constraintOwningView(with: self.left.view as AnyObject?, and: self.right.view as AnyObject?)
    }
}

public extension NSLayoutConstraint {
    public var owningView: UIView? {
        return constraintOwningView(with: self.firstItem, and: self.secondItem)
    }
}

public func constraintOwningView(with firstItem: AnyObject?, and secondItem: AnyObject?) -> UIView? {
    var view: UIView?
    
    var firstView: UIView?
    var secondView: UIView?
    if let v = firstItem as? UIView {
        firstView = v
    }else if let v = firstItem as? UILayoutGuide {
        firstView = v.owningView
    }else if let _ = firstItem as? AJLayoutSide, let v = secondItem as? UIView {
        firstView = v.superview
    }
    
    if let v = secondItem as? UIView {
        secondView = v
    }else if let v = secondItem as? UILayoutGuide {
        secondView = v.owningView
    }else if let _ = secondItem as? AJLayoutSide, let v = firstItem as? UIView {
        secondView = v.superview
    }
    
    if let v1 = firstView, let v2 = secondView {
        if v1 == v2 {
            view = v1
        }else if v1.superview == v2.superview { // A and B are at the same level
            view = v1.superview
        } else if v1.superview == v2 { // A is in B (first level)
            view = v2
        } else if v2.superview == v1 { // B is in A (first level)
            view = v1
        } else if v1.isDescendant(of: v2) { // A is in B (LOW level)
            view = v2
        } else if v2.isDescendant(of: v1) { // B is in A (LOW level)
            view = v1
        }else {
            view = commonParent(with: v1, and: v2)
        }
    }else if let v1 = firstView {
        view = v1
    }
    
    return view
}

func commonParent(with viewA: UIView, and viewB: UIView) -> UIView? {
    
    // Both views should have a superview
    guard viewA.superview != nil && viewB.superview != nil else {
        return nil
    }
    
    // Find the common parent
    var spv = viewA.superview
    while spv != nil {
        if viewA.isDescendant(of: spv!) && viewB.isDescendant(of: spv!) {
            return spv
        } else {
            spv = spv?.superview
        }
    }
    return nil
}
