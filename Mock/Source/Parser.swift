//
//  Parser.swift
//  Mock
//
//  Created by ZhangJing on 2018/4/3.
//  Copyright © 2018年 xiuye. All rights reserved.
//

import Foundation
import Regex

class Parser {
    var key:String!
    var range : CountableClosedRange<Int>!
    func parse(key : String){
        guard let result = RegularExpression.KEY.r?.findFirst(in: key)else{ return }
        
        print(result.subgroups)
        self.key = result.group(at: 1)
        guard let rangeStr = result.group(at: 3) else {
            fatalError("没有匹配到key")
        }
        guard let rangeRes = RegularExpression.RANGE.r?.findFirst(in: rangeStr) else {
            fatalError("没有匹配到范围")
        }
        let arr = rangeRes.subgroups.flatMap({Int($0!)})
        let min = arr.min()!
        let max = arr.max()!
        self.range = min...max
    }
    
}
