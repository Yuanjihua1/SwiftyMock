//
//  Rule.swift
//  Mock
//
//  Created by ZhangJing on 2018/4/9.
//  Copyright © 2018年 xiuye. All rights reserved.
//

import Foundation

open class Rule{
    
    var key : String = ""
    
    func parse(node : MockNode) -> MockNode{
        fatalError("this class cannot use , must inherit it")
    }
    
    class func create(from key: String) -> Rule?{
    
        guard let match = RegularExpression.KEY.r?.findFirst(in: key)else{
            return nil
        }
        
        guard let key = match.group(at: 1) else {
            return nil
        }
        
        if let ruleStr = match.group(at: 3),let range = RegularExpression.RANGE.r?.findFirst(in: ruleStr){
            let res = range.subgroups.flatMap{ (str) -> Int? in
                if let str = str{
                    return Int(str)
                }else{
                    return nil
                }
            }
            
            if res.count == 1,let count = res.first{
                let rule = CountRule.init(count)
                rule.key = key
                return rule
            }else if let min = res.min(),let max = res.max(){
                let rule = RangeRule.init(min...max)
                rule.key = key
                return rule
            }
            
        }
        
        return nil
    }
}

open class CountRule : Rule{
    var count : Int
    init(_ count: Int) {
        self.count = count
    }
    
    override func parse(node : MockNode) -> MockNode{
        switch node {
        case .string(let some):
            return MockNode.string(some * count)
        case .number(let some):
            return MockNode.number(NSNumber(value:(some.floatValue + Float(count))))
        case .list(let some):
            var arr = [MockNode]()
            for item in some{
                for _ in 0..<count{
                    arr.append(item)
                }
            }
            return MockNode.list(arr)
        case .object(_):
            return node
        }
    }
    
}

open class RangeRule : Rule{
    var range : CountableClosedRange<Int>
    init(_ range: CountableClosedRange<Int>) {
        self.range = range
    }
    
    override func parse(node : MockNode) -> MockNode{
        switch node {
        case .string(let some):
            return MockNode.string(some * Int.random(in: range))
        case .number(_):
            return MockNode.number(NSNumber(value:Int.random(in: range)))
        case .list(let some):
            var arr = [MockNode]()
            
            for item in some{
                for _ in 0..<Int.random(in: range){
                    arr.append(item)
                }
            }
            
            return MockNode.list(arr)
        case .object(let some):
            var dic = [String:MockNode]()
            let num = Int.random(in: range)
            var count = 0
            for (key,value) in some{
                dic[key] = value
                count += 1
                if count >= num {
                    break
                }
            }
            return MockNode.object(dic)
        }
    }
    
}
