//
//  AJLayoutKit+Align.swift
//  AJLayoutKit
//
//  Created by 肖爱军 on 2019/2/12.
//

import Foundation
import UIKit

public func equal(_ attribute: NSLayoutConstraint.Attribute, _ objects: UIView...) -> [AJLayoutConstraint] {
    var layouts: [AJLayoutConstraint] = []
    for (i, o) in objects.enumerated() {
        if i < objects.count - 1 {
            let left = AJLayoutAttribute(o, attribute: attribute)
            let right = AJLayoutAttribute(objects[i + 1], attribute: attribute)
            let c = AJLayoutConstraint(left: left, right: right)
            layouts.append(c)
        }
    }
    
    return layouts
}
