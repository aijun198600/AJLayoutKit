//
//  AJLayoutKit+Size.swift
//  AJLayoutKit
//
//  Created by 肖爱军 on 2019/2/8.
//

import Foundation
import UIKit

public extension UIView {
    @discardableResult
    func width(_ width: AJValue) -> UIView {
        let left = AJLayoutAttribute(self, attribute: .width)
        let constraint = AJLayoutConstraint(left: left, right: AJLayoutAttribute(), value: width)
        constraint.addConstraints()
        
        return self
    }
    
    @discardableResult
    func height(_ height: AJValue) -> UIView {
        let left = AJLayoutAttribute(self, attribute: .height)
        let constraint = AJLayoutConstraint(left: left, right: AJLayoutAttribute(), value: height)
        constraint.addConstraints()
        
        return self
    }
    
    @discardableResult
    func size(_ value: AJValue) -> UIView {
        self.width(value)
        self.height(value)
        return self
    }
    
    @discardableResult
    func size(_ width: AJValue, _ height: AJValue) -> UIView {
        self.width(width)
        self.height(height)
        return self
    }
    
    @discardableResult
    func maxWidth(_ width: AJValue) -> UIView {
        let left = AJLayoutAttribute(self, attribute: .width)
        let constraint = AJLayoutConstraint(left: left, right: AJLayoutAttribute(), value: width, relation: .greaterThanOrEqual)
        constraint.addConstraints()
        
        return self
    }
    
    @discardableResult
    func minWidth(_ width: AJValue) -> UIView {
        let left = AJLayoutAttribute(self, attribute: .width)
        let constraint = AJLayoutConstraint(left: left, right: AJLayoutAttribute(), value: width, relation: .lessThanOrEqual)
        constraint.addConstraints()
        
        return self
    }
    
    @discardableResult
    func maxHeight(_ height: AJValue) -> UIView {
        let left = AJLayoutAttribute(self, attribute: .height)
        let constraint = AJLayoutConstraint(left: left, right: AJLayoutAttribute(), value: height, relation: .greaterThanOrEqual)
        constraint.addConstraints()
        
        return self
    }
    
    @discardableResult
    func minHeight(_ height: AJValue) -> UIView {
        let left = AJLayoutAttribute(self, attribute: .height)
        let constraint = AJLayoutConstraint(left: left, right: AJLayoutAttribute(), value: height, relation: .lessThanOrEqual)
        constraint.addConstraints()
        return self
    }
    
    @discardableResult
    func maxSize(_ value: AJValue) -> UIView {
        self.maxWidth(value)
        self.maxHeight(value)
        return self
    }
    
    @discardableResult
    func minSize(_ value: AJValue) -> UIView {
        self.minWidth(value)
        self.minHeight(value)
        return self
    }
    
    @discardableResult
    func maxSize(_ width: AJValue, _ height: AJValue) -> UIView {
        self.maxWidth(width)
        self.maxHeight(height)
        return self
    }
    
    @discardableResult
    func minSize(_ width: AJValue, _ height: AJValue) -> UIView {
        self.minWidth(width)
        self.minHeight(height)
        return self
    }
}
