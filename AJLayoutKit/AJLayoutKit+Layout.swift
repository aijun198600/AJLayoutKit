//
//  AJLayoutKit+Layout.swift
//  AJLayoutKit
//
//  Created by 肖爱军 on 2019/2/8.
//

import Foundation
import UIKit

public extension UIView {
    
    @discardableResult
    public func sv(_ subViews: UIView...) -> UIView {
        return sv(subViews)
    }
    
    @discardableResult
    public func sv(_ subViews: [UIView]) -> UIView {
        for sv in subViews {
            addSubview(sv)
            sv.translatesAutoresizingMaskIntoConstraints = false
        }
        return self
    }
    
    @discardableResult
    public func layout(_ objects: Any...) -> UIView {
        return layout(objects)
    }
    
    @discardableResult
    public func layout(_ objects: [Any]) -> UIView {
        
        for (_, o) in objects.enumerated() {
            switch o {
            case let c as AJLayoutContainer:
                c.addConstraints()
            case let c as AJLayoutConstraint:
                c.addConstraints()
            default: ()
            }
        }
        
        return self
    }
}