//
//  AJLayoutKit+Chain.swift
//  AJLayoutKit
//
//  Created by 肖爱军 on 2019/2/8.
//

import Foundation
import UIKit

public enum AJLayoutDirect {
    case vertical   // 垂直方向
    case horizontal     // 水平方向
    case unkown
}

public class AJLayoutChain {
    var attribute: AJLayoutAttribute
    var value: AJValue?
    
    public init(attribute: AJLayoutAttribute) {
        self.attribute = attribute
    }
    
    public init(attribute: AJLayoutAttribute, value:AJValue?) {
        self.attribute = attribute
        self.value = value
    }
}

public class AJLayoutContainer {
    public var constraints:[AJLayoutConstraint] = []
    var direct: AJLayoutDirect = .unkown
    
    var chain: AJLayoutChain
    
    public init(chain: AJLayoutChain) {
        self.chain = chain
    }
    
    public init(chain: AJLayoutChain, direct: AJLayoutDirect) {
        self.chain = chain
        self.direct = direct
    }
}




