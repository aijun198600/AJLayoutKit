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
        
        let x = 10.33% + 14.0 ~ "TestIdentifier" ~ 800
        print(x)
        
        let y = 10.33% + 14.0 ^ "TestIdentifier" ~ 800
        print(y)

        
        let value = 10.33% + 14.0 ~ 800
        print("\(value)")
        
        self.testViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testViews() {
        
        let panel = UIView()
        panel.layer.cornerRadius = 10.0
        panel.layer.borderWidth = 1.0
        panel.layer.borderColor = UIColor.gray.cgColor
        let title = UILabel()
        title.text = "查看会员信息"
        
        let avatar = UIImageView()
        avatar.backgroundColor = UIColor.red
        avatar.layer.masksToBounds = true
        avatar.layer.cornerRadius = 10
        let name = UILabel()
        name.text = "aijunx"
        let level = UILabel()
        level.text = "15"
        let vip = UILabel()
        vip.text = "VIP"
        vip.textColor = UIColor.red
        let desc = UILabel()
        desc.text = "个人简介说明...."
        
        let v1 = UIView()
        v1.backgroundColor = UIColor.orange
        
        self.view.sv(
            title,
            v1,
            panel.sv(
                avatar,
                name,
                level,
                vip,
                desc
            )
        )
        
        self.view.layout(
            |-(10% + 10)-title,
            |-(10% + 10)-panel-(10% + 10 ^ "right ratio span")-|,
            &-title-(10 ^ "title bottom")-panel,
            panel.layout(
                |-15-avatar.width(20%)-15-name-15-level-15-vip,
                &-15-avatar-15-&,
                &-15-name-15-desc,
                avatar.Width == avatar.Height,
                equal(.centerY, name, level, vip),
                equal(.leading, name, desc)
            ),
            ||v1.size(50% + 15)-(50% - 15)-|,
            &-(50% - 15)-v1.size(50% + 15)
        )
        
    }

}

