//
//  FuncMapTest.swift
//  MockTests
//
//  Created by ZhangJing on 2018/4/18.
//  Copyright © 2018年 xiuye. All rights reserved.
//

import XCTest

class FuncMapTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let fm : FuncMapper = FuncMapper()
        let result = fm.parsed(template: "姓:@first() 名:@last()")
        print(result)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCurrent(){
        let a = FuncMapper().currentDate()
        print(a)
    }
    
    func testDateTime(){
        let fm = FuncMapper().datetime()
        print(fm)
    }
    
    func testImage(){
//        let fm = FuncMapper().imageUrl(80,80)
//        print(fm)http://lorempixel.com/80/80/
        let node = MockNode.string("@imageUrl(100,80)")
        print(node.parsed())
        
    }
    
}
