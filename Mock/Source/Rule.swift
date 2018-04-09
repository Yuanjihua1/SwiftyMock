//
//  Rule.swift
//  Mock
//
//  Created by ZhangJing on 2018/4/9.
//  Copyright © 2018年 xiuye. All rights reserved.
//

import Foundation

open class Rule{
    
    init() {
        fatalError("this class cannot use , must inherit it")
    }
    
    func parse(node : Node) -> Node{
        fatalError("this class cannot use , must inherit it")
    }
    
    class func getRule(from key: String) -> Rule{
        return CountRule.init(1)
    }
}

open class CountRule : Rule{
    var count : Int
    init(_ count: Int) {
        self.count = count
    }
}

open class RangeRule : Rule{
    var range : CountableClosedRange<Int>
    init(_ range: CountableClosedRange<Int>) {
        self.range = range
    }
}
