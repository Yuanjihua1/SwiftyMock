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
        
        let stu1 = ["name":"@cname()","age|10-30":21,"no":"1","height":168.1,"address":"@address()"] as [String : Any]
        
        let teacher = ["name":"@cname()","age|30-50":50,"height":188.3,"students|1-10":[stu1]] as [String : Any]
        
        let node = Node.create(by: teacher)
        if let dic = node.parsed() as? [String:Any]{
            print(dic)
            print("teacher:",dic["age"])
            if let arr = dic["students"] as? [[String:Any]]{
                for item in arr{
                    print("student:",item["age"])
                }
            }
        }
    }
    
}
