//
//  ConstantRegular.swift
//  MockTests
//
//  Created by ZhangJing on 2018/3/30.
//  Copyright © 2018年 xiuye. All rights reserved.
//

import XCTest
import Regex

class ConstantRegularTest: XCTestCase {
    
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
        if let res = Constant.REGULAR_KEY.r?.findFirst(in: "name|1-10:xiuye")?.group(at: 1) {
            print(res)
            XCTAssertEqual(res, "name")
        }else{
            XCTAssert(false, "正则匹配失败")
        }
    }
    
    func testRange(){
        if let res = Constant.REGULAR_RANGE.r?.findFirst(in: "name|1-10:xiuye")?.subgroups{
            let ranges = res.flatMap{
                Int($0!)
            }
            guard let min = ranges.min() else {return}
            guard let max = ranges.max() else {return}
            print(min,max)
            XCTAssertEqual([min,max], [1,10])
            XCTAssertLessThan(min, max)
        }else{
            XCTAssert(false, "正则匹配失败")
        }
        
    }
    
}
