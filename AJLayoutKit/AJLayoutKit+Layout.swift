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
    func sv(_ subViews: UIView...) -> UIView {
        return sv(subViews)
    }
    
    @discardableResult
    func sv(_ subViews: [UIView]) -> UIView {
        for sv in subViews {
            addSubview(sv)
            sv.translatesAutoresizingMaskIntoConstraints = false
        }
        return self
    }
    
    @discardableResult
    func layout(_ objects: Any...) -> UIView {
        return layout(objects)
    }
    
    @discardableResult
    func layout(_ objects: [Any]) -> UIView {
        
        for (_, o) in objects.enumerated() {
            switch o {
            case let c as AJLayoutContainer:
                c.addConstraints()
            case let c as AJLayoutConstraint:
                c.addConstraints()
            case let c as [AJLayoutConstraint]:
                for i in c{ i.addConstraints() }
            default: ()
            }
        }
        
        return self
    }
}
