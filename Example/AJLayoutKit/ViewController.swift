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

    var constraint: [NSLayoutConstraint] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

//        var v = 10% + 10
//        print(v)
//        v.reverse()
//        print(v)
        
        let x = 10.33% + 14.0 ~ "TestIdentifier" ~ 800
        print(x)
        
        let y = 10.33% + 14.0 ^ "TestIdentifier" ~ 800
        print(y)

        
        let value = 10.33% + 14.0 ~ 800
        print("\(value)")
        
//        let guide = UILayoutGuide()
//        guide.identifier = "AJLayoutKitSpan"
//        self.view.addLayoutGuide(guide)
//        let guideW = NSLayoutConstraint(item: guide, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 80)
//        guideW.identifier = "AJSpanLayoutGuideConstraint"
//        self.view.addConstraint(guideW)
//
//        let view = UIView()
//        view.backgroundColor = UIColor.red
//        view.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(view)
//
//        let w = NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 80)
//        view.addConstraint(w)
//        view.addConstraint(NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 80))
//        self.view.addConstraint(NSLayoutConstraint(item: self.view.safeArea, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0))
//        self.view.addConstraint(NSLayoutConstraint(item: self.view.safeArea, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0))
//
//        print(self.view.layoutGuides)
//
//
//        let isBool: Bool? = true
//        print(!isBool!)
//
//        let side: AJLayoutElement? = UIView()
//        if side is AJLayoutSide {
//            print("is AJLayoutSide")
//        }else {
//            print("not AJLayoutSide")
//        }
        
        let btn = UIButton(frame: CGRect(x: 20, y: 64, width: 200, height: 100))
        btn.backgroundColor = UIColor.orange
        btn.setTitle("点击参数", for: .normal)
        btn.addTarget(self, action: #selector(self.btnAction), for: .touchUpInside)
        
        self.view.addSubview(btn)
    }
    
    @objc func btnAction() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.testViews()
        
//        self.testCode()
    }
    
    
    func testCode() {
        let v1 = UIView()
        v1.backgroundColor = UIColor.red
        v1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(v1)
        
        let list = [
            NSLayoutConstraint(item: v1, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.3, constant: 100),
            NSLayoutConstraint(item: v1, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0.3, constant: 100),
            NSLayoutConstraint(item: v1, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 0.2, constant: 80),
            NSLayoutConstraint(item: v1, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 0.2, constant: 80)
        ]
        
        constraint = list
        for c in list {
            if let v = c.owningView {
                v.addConstraint(c)
            }
        }
//        self.view.addConstraints(list)
    }
    
    
    func testViews() {
        let v1 = UIView()
        v1.backgroundColor = UIColor.green
        let v2 = UIView()
        v2.backgroundColor = UIColor.red
        
        self.view.sv(
            v1,
            v2
        )
        
        let x1 = |-(50% + 10 ^ "v1 left")-v1.size(300 ^ "v1 size")-v2.size(80 ^ "v2 size")
        let x2 = &-(50% + 10 ^ "v1 top")-v1-v2
        self.view.layout(
            x1,
            x2
        )
        
        for c in v1.constraints {
            print(c)
        }
        
//        v1.addConstraint(NSLayoutConstraint(item: v1, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100))
//        v1.addConstraint(NSLayoutConstraint(item: v1, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100))
        
//        v1.size(300)
        
//        v1.size(30% + 20 ^ "v1 width", 30% + 20 ^ "v1 height")
//        v1.size(100)
//        let w = AJLayoutConstraint(left: AJLayoutAttribute(v1, attribute: .width), right: AJLayoutAttribute(), value: 30% + 20 ^ "v1 width")
//        let h = AJLayoutConstraint(left: AJLayoutAttribute(v1, attribute: .height), right: AJLayoutAttribute(), value: 100)
//        w.addConstraints()
//        h.addConstraints()
//        self.view.addConstraints(w.generateConstraints())
//        self.view.addConstraints(h.generateConstraints())
        
//        let left = AJLayoutConstraint(left: AJLayoutAttribute(AJLayoutSide.leading, attribute: .leading), right: AJLayoutAttribute(v1, attribute: .leading), value: 50 ^ "v1 left")
//        left.addConstraints()
//        let top = AJLayoutConstraint(left: AJLayoutAttribute(AJLayoutSide.top, attribute: .top), right: AJLayoutAttribute(v1, attribute: .top), value: 50 ^ "v1 top")
//        top.addConstraints()
        
//        let right = AJLayoutConstraint(left: AJLayoutAttribute(AJLayoutSide.trailing, attribute: .trailing), right: AJLayoutAttribute(v1, attribute: .trailing), value: 50% - 150 ^ "v1 left")
//        right.type = .chain
//        right.addConstraints()
//        let bottom = AJLayoutConstraint(left: AJLayoutAttribute(AJLayoutSide.bottom, attribute: .bottom), right: AJLayoutAttribute(v1, attribute: .bottom), value: 50% - 150 ^ "v1 top")
//        bottom.addConstraints()
        
//        let top = NSLayoutConstraint(item: v1, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 0.2, constant: 80)
//        let left = NSLayoutConstraint(item: v1, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 0.2, constant: 80)
//        self.view.addConstraint(left)
//        self.view.addConstraint(top)
        
    }

}

