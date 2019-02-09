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
