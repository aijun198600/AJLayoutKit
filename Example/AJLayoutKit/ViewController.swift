//
//  ViewController.swift
//  AJLayoutKit
//
//  Created by aijun xiao on 02/03/2019.
//  Copyright (c) 2019 aijun xiao. All rights reserved.
//

import UIKit
import AJLayoutKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let x = 10.33% + 14.0 ~ "TestIdentifier" ~ 800
        print(x)
        
        let y = 10.33% + 14.0 ^ "TestIdentifier" ~ 800
        print(y)

        
        let value = 10.33% + 14.0 ~ 800
        print("\(value)")
        
        let guide = UILayoutGuide()
        guide.identifier = "AJLayoutKitSpan"
        self.view.addLayoutGuide(guide)
        let guideW = NSLayoutConstraint(item: guide, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 80)
        guideW.identifier = "AJSpanLayoutGuideConstraint"
        self.view.addConstraint(guideW)
        
        print(self.view.layoutGuides)
        
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)

        let w = NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 80)
        view.addConstraint(w)
        view.addConstraint(NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 80))
        self.view.addConstraint(NSLayoutConstraint(item: self.view.safeArea, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.view.safeArea, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0))
        
//        self.view.removeConstraint(guideW)
        
        print("after removeConstraint")
        if let v = guide.owningView, guide.identifier.hasPrefix("AJLayoutKit") {
            v.removeLayoutGuide(guide)
        }
//        self.view.removeLayoutGuide(guide)
        for i in self.view.constraints {
            print(i)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

