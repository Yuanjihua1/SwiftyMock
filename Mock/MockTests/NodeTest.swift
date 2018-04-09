//
//  NodeTest.swift
//  MockTests
//
//  Created by ZhangJing on 2018/4/9.
//  Copyright © 2018年 xiuye. All rights reserved.
//

import XCTest

class NodeTest: XCTestCase {
    
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

    func testNode(){
        
        let stu1 = ["name":"小红","age":21,"no":"1"] as [String : Any]
        let stu2 = ["name":"小黄","age":22,"no":"2"] as [String : Any]
        let stu3 = ["name":"小蓝","age":23,"no":"3"] as [String : Any]
        
        let teacher = ["name":"小白","age":50,"students":[stu1,stu2,stu3]] as [String : Any]
        
        let node = Node.create(by: teacher)
        print(node.parsed())
    }
    
}
