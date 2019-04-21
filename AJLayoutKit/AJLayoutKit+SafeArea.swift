//
//  AJLayoutKit+SafeArea.swift
//  AJLayoutKit
//
//  Created by 肖爱军 on 2019/2/8.
//

import Foundation
import UIKit

extension UILayoutGuide: AJLayoutElement {}

public extension UIView {
    @available(iOS 11.0, *)
    var safeArea: UILayoutGuide{
        return self.safeAreaLayoutGuide
    }
}

public extension UILayoutGuide {
    var Width: AJLayoutAttribute {
        return AJLayoutAttribute(self, attribute: .width)
    }
    
    var Height: AJLayoutAttribute {
        return AJLayoutAttribute(self, attribute: .height)
    }
    
    var Top: AJLayoutAttribute {
        return AJLayoutAttribute(self, attribute: .top)
    }
    
    var Bottom: AJLayoutAttribute {
        return AJLayoutAttribute(self, attribute: .bottom)
    }
    
    var Left: AJLayoutAttribute {
        return AJLayoutAttribute(self, attribute: .left)
    }
    
    var Right: AJLayoutAttribute {
        return AJLayoutAttribute(self, attribute: .right)
    }
    
    var Leading: AJLayoutAttribute {
        return AJLayoutAttribute(self, attribute: .leading)
    }
    
    var Trailing: AJLayoutAttribute {
        return AJLayoutAttribute(self, attribute: .trailing)
    }
    
    var CenterX: AJLayoutAttribute {
        return AJLayoutAttribute(self, attribute: .centerX)
    }
    
    var CenterY: AJLayoutAttribute {
        return AJLayoutAttribute(self, attribute: .centerY)
    }
    
    var FirstBaseline: AJLayoutAttribute {
        return AJLayoutAttribute(self, attribute: .firstBaseline)
    }
    
    var LastBaseline: AJLayoutAttribute {
        return AJLayoutAttribute(self, attribute: .lastBaseline)
    }
}


