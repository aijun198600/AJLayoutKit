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

public struct AJLayoutAttribute {
    // if view is nil, this means the view is super view
    var view: AJLayoutElement?
    var attribute: NSLayoutConstraint.Attribute = .notAnAttribute
    
    public init(_ attribute: NSLayoutConstraint.Attribute) {
        self.attribute = attribute
    }
    
    public init(_ view: AJLayoutElement?, attribute: NSLayoutConstraint.Attribute) {
        self.view = view
        self.attribute = attribute
    }
}

public class AJLayoutConstraint {
    let left: AJLayoutAttribute
    var relation: NSLayoutConstraint.Relation = .equal
    let right: AJLayoutAttribute
    var value: AJValue?
    var constraints: [NSLayoutConstraint] = []
    
    public init(left: AJLayoutAttribute, right: AJLayoutAttribute) {
        self.left = left
        self.right = right
    }
    
    public init(left: AJLayoutAttribute, right: AJLayoutAttribute, value:AJValue?) {
        self.left = left
        self.right = right
        self.value = value
    }
    
    public init(left: AJLayoutAttribute, right: AJLayoutAttribute, value:AJValue? = 0, relation: NSLayoutConstraint.Relation) {
        self.left = left
        self.right = right
        self.value = value
        self.relation = relation
    }
    
    deinit {
        self.removeConstraints()
    }
}

