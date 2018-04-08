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
    var range : CountableClosedRange<Int>?
    var count : Int?
    
    func parse(key : String){
        guard let result = RegularExpression.KEY.r?.findFirst(in: key)else{
            self.key = key
            return
        }
        
        MockLog(key)
        self.key = result.group(at: 1)
        guard let rangeStr = result.group(at: 3) else {
            fatalError("没有匹配到key")
        }
        guard let rangeRes = RegularExpression.RANGE.r?.findFirst(in: rangeStr) else {
            fatalError("没有匹配到范围")
        }
        let arr = rangeRes.subgroups.flatMap{ str  -> Int? in
            if let numStr = str {
                return Int(numStr)
            }else{
                return nil
            }
        }
        if let count = arr.first, arr.count == 1 {
            self.count = count
        }else if let min = arr.min() ,let max = arr.max(){
            self.range = min...max
        }
    }
    
    func parse(template: String) -> String{
        
        return template
    }
    
}
