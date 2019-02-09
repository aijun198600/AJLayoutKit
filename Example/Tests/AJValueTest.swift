//
//  AJValueTest.swift
//  AJLayoutKit_Tests
//
//  Created by 肖爱军 on 2019/2/8.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
@testable import AJLayoutKit

class AJValueTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testOperator() {
        let p: AJPercent = 15%
        XCTAssertEqual(p.value, CGFloat(15.0 / 100))
        
        let x: AJValue = 10.33% + 14.0
        XCTAssertEqual(x.constant, 14.0)
        XCTAssertEqual(x.percent!.value, CGFloat(10.33 / 100))
        
        let y: AJValue = 10.33% - 14.0
        XCTAssertEqual(y.constant, -14.0)
        XCTAssertEqual(y.percent!.value, CGFloat(10.33 / 100))
    }
    
    func testPriorityOperator() {
        let x: AJValue = 10.33% + 14.0 ~ 800
        XCTAssertEqual(x.priority, 800)
    }
    
    func testIdentifierOperator() {
        let x: AJValue = 10.33% + 14.0 ~ 800 ^ "TestValue"
        XCTAssertEqual(x.identifier, "TestValue")
    }
    
    func testSetPriority() {
        var x: AJValue = 10.33% + 14.0 ~ 800
        x.setPriority(100)
        XCTAssertEqual(x.priority, 100)
    }
    
    func testSetIdentifier() {
        var x: AJValue = 10.33% + 14.0 ~ 800
        x.setIdentifier("TestIdentifier")
        XCTAssertEqual(x.identifier, "TestIdentifier")
    }
    
    func testVW() {
        let x = vw(80)
        let sw = UIScreen.main.bounds.size.width
        XCTAssertEqual(x.constant, 80 * sw / 100.0)
    }
    
    func testVH() {
        let x = vh(80)
        let sh = UIScreen.main.bounds.size.height
        XCTAssertEqual(x.constant, 80 * sh / 100.0)
    }
    
    func testRPX() {
        let x = rpx(99.5)
        let sw = UIScreen.main.bounds.size.width
        XCTAssertEqual(x.constant, 99.5 * sw / 750.0)
    }
    
}
