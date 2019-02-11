//
//  AJLayoutKit+AddConstraints.swift
//  AJLayoutKit
//
//  Created by 肖爱军 on 2019/2/8.
//

import Foundation
import UIKit

public extension AJLayoutContainer {
    
    public func addConstraints() {
        for c in constraints {
            c.addConstraints()
        }
    }
    
}

public extension AJLayoutConstraint {
    
    public func addConstraints() {
//        self.removeConstraints()
        self.generateConstraints()
        
//        for c in self.layoutConstraints {
//            if let v = c.owningView {
//                // add guide
//                if let g1 = c.firstItem as? UILayoutGuide, !v.layoutGuides.contains(g1) {
//                    v.addLayoutGuide(g1)
//                }
//                if let g2 = c.secondItem as? UILayoutGuide, !v.layoutGuides.contains(g2) {
//                    v.addLayoutGuide(g2)
//                }
//
//                v.addConstraint(c)
//            }else {
//                print("no owningView!!!")
//            }
//        }
//
//        NSLayoutConstraint.activate(self.layoutConstraints)
    }
    
    public func constraint(_ argument: AJLayoutArgument) -> NSLayoutConstraint {
        let c = NSLayoutConstraint(item: argument.firstItem, attribute: argument.firstAttribute, relatedBy: self.relation, toItem: argument.secondItem, attribute: ((argument.secondAttribute == nil) ? argument.firstAttribute : argument.secondAttribute!), multiplier: argument.multiplier, constant: argument.constant)
        var priority: UILayoutPriority = UILayoutPriority(rawValue: 1000)
        var identifier: String?
        if let v = value {
            priority = UILayoutPriority(rawValue: v.priority)
            identifier = v.identifier
        }
        c.priority = priority
        c.identifier = identifier
        return c
    }
}

public struct AJLayoutArgument {
    var firstItem: AnyObject
    var firstAttribute: NSLayoutConstraint.Attribute
    var multiplier: CGFloat
    var constant: CGFloat
    var secondItem: AnyObject?
    var secondAttribute: NSLayoutConstraint.Attribute?
    
    public init(item view1: AnyObject,
         attribute attr1: NSLayoutConstraint.Attribute,
         toItem view2: AnyObject? = nil,
         attribute attr2: NSLayoutConstraint.Attribute? = nil, // Not an attribute??
        multiplier: CGFloat = 1,
        constant: CGFloat = 0) {
        self.firstItem = view1
        self.firstAttribute = attr1
        self.secondItem = view2
        self.secondAttribute = attr2
        self.multiplier = multiplier
        self.constant = constant
    }
}

public extension AJLayoutConstraint {
    // generate constraints and add the UILayoutGuide
    public func generateConstraints() {
        if self.type == .side {
            self.createSideConstraints()
        }else if (self.type == .chain) {
            self.createChainConstraints()
        }else if self.type == .dimension {
            self.createDimensionConstraints()
        }
    }
}

public extension AJLayoutConstraint {
    
    func createDimensionConstraints() {
        guard self.type == .dimension else {
            return
        }
        
        var view: UIView
        var attr: AJLayoutAttribute
        if self.left.view != nil {
            view = self.left.view as! UIView
            attr = self.left
        }else {
            view = self.right.view as! UIView
            attr = self.right
        }
        
        if let value = self.value, let percent = value.percent, let spv = view.superview {
            let arg = AJLayoutArgument(item: view, attribute: attr.attribute, toItem: spv, attribute: attr.attribute, multiplier: percent.value, constant: value.constant)
            let c = self.constraint(arg)
            c.owningView?.addConstraint(c)
//            self.layoutConstraints.append(c)
        }else {
            let arg = AJLayoutArgument(item: view, attribute: attr.attribute, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: (self.value != nil ? self.value!.constant : 0))
            let c = self.constraint(arg)
            c.owningView?.addConstraint(c)
//            self.layoutConstraints.append(c)
        }
    }
    
    func createSideConstraints() {
        guard self.type == .side else {
            return
        }
        
        guard (self.left.view is UIView || self.right.view is UIView) else {
            fatalError("if use AJLayoutSide, must be with UIView")
        }
        
        guard self.left.attribute == self.right.attribute else {
            fatalError("if use AJLayoutSide, the attribute of view must be the same")
        }
        
        let attribute = self.left.attribute
        var view: UIView!
        var spv: AnyObject!
        var value: AJValue = 0
        if let v = self.value {
            value = v
        }
        if let v = self.left.view as? UIView {
            view = v
            spv = v.superview
            value.reverse()
        }else if let v = self.right.view as? UIView {
            view = v
            spv = v.superview
        }
        
        guard view != nil && spv != nil else {
            fatalError("if use AJLayoutSide, the view must have superview")
        }
        
        if #available(iOS 11.0, *) {
            // if the superview has no superview, it should use safe area, present superview be the viewcontroller's view
            if let v = spv as? UIView, v.superview is UIWindow {
                spv = v.safeAreaLayoutGuide
            }
        }
        
        let firstItem = view
        let secondItem = spv
        var firstAttribute: NSLayoutConstraint.Attribute = .notAnAttribute
        var secondAttribute: NSLayoutConstraint.Attribute = .notAnAttribute
        var multiplier: CGFloat = 1.0
        var constant: CGFloat = 0
        switch attribute {
        case .leading:
            // like |-(10% + 10)-view
            if let percent = value.percent, percent.value != 0 {
                firstAttribute = .leading
                secondAttribute = .trailing
                multiplier = percent.value
                constant = value.constant
            }else {
                firstAttribute = .leading
                secondAttribute = .leading
                constant = value.constant
            }
        case .trailing:
            // like view-(10% + 10)-|
            if let percent = value.percent, percent.value != 0 {
                firstAttribute = .trailing
                secondAttribute = .trailing
                multiplier = 1.0 - percent.value
                constant = -value.constant
            }else {
                firstAttribute = .trailing
                secondAttribute = .trailing
                constant = -value.constant
            }
        case .top:
            // like &-(10% + 10)-view
            if let percent = value.percent, percent.value != 0 {
                firstAttribute = .top
                secondAttribute = .bottom
                multiplier = percent.value
                constant = value.constant
            }else {
                firstAttribute = .top
                secondAttribute = .top
                constant = value.constant
            }
        case .bottom:
            // like  view-(10% + 10)-&
            if let percent = value.percent, percent.value != 0 {
                firstAttribute = .bottom
                secondAttribute = .bottom
                multiplier = percent.value
                constant = -value.constant
            }else {
                firstAttribute = .bottom
                secondAttribute = .bottom
                constant = -value.constant
            }
        default: ()
        }
        
        let arg = AJLayoutArgument(item: firstItem!, attribute: firstAttribute, toItem: secondItem!, attribute: secondAttribute, multiplier: multiplier, constant: constant)
        let c = self.constraint(arg)
        c.owningView?.addConstraint(c)
//        self.layoutConstraints.append(c)
    }
    
    func createChainConstraints() {
        guard self.type == .chain else {
            return
        }
        
        var leftView: UIView
        var rightView: UIView
        guard left.view is UIView && right.view is UIView else {
            debugPrint("chain constraint must use for UIView")
            return
        }
        
        leftView = left.view as! UIView
        rightView = right.view as! UIView
        guard leftView.superview != nil && leftView.superview == rightView.superview else {
            debugPrint("chain constraint must have same superview")
            return
        }
        
        guard (left.attribute == .bottom && right.attribute == .top) || (left.attribute == .top && right.attribute == .bottom) || (left.attribute == .leading && right.attribute == .trailing) || (left.attribute == .trailing && right.attribute == .leading) else {
            debugPrint("chain constraint use for horizontal or vertical direction")
            return
        }
        
        if let value = self.value, let percent = value.percent, percent.value != 0 {
            let span = UILayoutGuide()
            span.identifier = "AJLayoutKitChainSpan"
            
            // addLayoutGuide first
            let view = constraintOwningView(with: leftView, and: rightView)
            view?.addLayoutGuide(span)
            
            let attr: NSLayoutConstraint.Attribute = (left.attribute == .leading || left.attribute == .trailing) ? .width : .height
            let spanArg = AJLayoutArgument(item: span, attribute: attr, toItem: view, attribute: attr, multiplier: percent.value, constant: value.constant)
            let spanConstraint = self.constraint(spanArg)
            spanConstraint.owningView?.addConstraint(spanConstraint)
            
            let leftArg = AJLayoutArgument(item: leftView, attribute: left.attribute, toItem: span, attribute: self.chainConnectAttribute(left.attribute), multiplier: 1.0, constant: 0)
            let leftConstraint = self.constraint(leftArg)
            leftConstraint.owningView?.addConstraint(leftConstraint)
            
            let rightArg = AJLayoutArgument(item: rightView, attribute: right.attribute, toItem: span, attribute: self.chainConnectAttribute(right.attribute), multiplier: 1.0, constant: 0)
            let rightConstraint = self.constraint(rightArg)
            rightConstraint.owningView?.addConstraint(rightConstraint)
        }else {
            let arg = AJLayoutArgument(item: leftView, attribute: left.attribute, toItem: rightView, attribute: right.attribute, multiplier: 1.0, constant: (self.value != nil ? self.value!.constant : 0))
            let c = self.constraint(arg)
            c.owningView?.addConstraint(c)
//            self.layoutConstraints.append(c)
        }
        
        return
    }
    
    fileprivate func chainConnectAttribute(_ attribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint.Attribute {
        switch attribute {
        case .bottom:
            return .top
        case .top:
            return .bottom
        case .leading:
            return .trailing
        case .trailing:
            return .leading
        default:
            return .notAnAttribute
        }
    }
}
