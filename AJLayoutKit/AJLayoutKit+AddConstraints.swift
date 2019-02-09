//
//  AJLayoutKit+AddConstraints.swift
//  AJLayoutKit
//
//  Created by 肖爱军 on 2019/2/8.
//

import Foundation
import UIKit

public extension AJLayoutConstraint {
    public func addConstraints() {
        self.removeConstraints()
        self.constraints = self.generateConstraints()
        
        for c in constraints {
            c.owningView?.addConstraint(c)
        }
    }
}

public extension AJLayoutConstraint {
    
    func generateConstraints() -> [NSLayoutConstraint] {
        var list: [NSLayoutConstraint] = []
        
        return list
    }
    
}
