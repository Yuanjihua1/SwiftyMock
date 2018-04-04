//
//  RegularExpressTest.swift
//  MockTests
//
//  Created by ZhangJing on 2018/4/4.
//  Copyright © 2018年 xiuye. All rights reserved.
//

import XCTest

class RegularExpressTest: XCTestCase {
    
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
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testKey(){
        if let result = RegularExpression.KEY.r?.findFirst(in: "name:xiuye")?.subgroups{
            MockLog(result)
        }else{
            XCTAssert(false)
        }
    }
    
    func testRegular(){
        if let result = RegularExpression.RANGE.r?.findFirst(in: "name|+1:1")?.subgroups{
            MockLog(result)
            MockLog(Int("-1"))
        }
    }
    
}
