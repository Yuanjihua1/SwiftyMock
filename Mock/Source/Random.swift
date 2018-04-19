//
//  Random.swift
//  Mock
//
//  Created by 李修冶 on 2018/4/3.
//  Copyright © 2018年 xiuye. All rights reserved.
//

import Foundation


public func *(_ left:String,_ right:Int) -> String{
    var sum = ""
    for _ in 0..<right{
        sum += left
    }
    return sum
}

extension Int{
    static func random(in range: CountableClosedRange<Int>) -> Int {
        return Int(arc4random_uniform(UInt32(range.upperBound - range.lowerBound + 1))) + range.lowerBound
    }
}

extension Array {
    var randomElement : Element{
        return self[Int.random(in: 0...self.count-1)]
    }
}
