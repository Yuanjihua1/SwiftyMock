//
//  Mock.swift
//  Mock
//
//  Created by ZhangJing on 2018/4/3.
//  Copyright © 2018年 xiuye. All rights reserved.
//

import Foundation

class Mock {
    
    init(template: [String:Any]) {
        handler(template)
    }
    
    var json = [String:Any]()
    
    func handler(_ template:String,parser: Parser){
        if let range = parser.range{
            json[parser.key] = template * Int.random(in: range)
        }else if let count = parser.count{
            json[parser.key] = template * count
        }else{
            json[parser.key] = template
        }
    }
    
    func handler(_ template:Int,parser:Parser){
        if let range = parser.range{
            json[parser.key] = Int.random(in: range)
        }
        if let count = parser.count{
            json[parser.key] = count + template
        }
    }
    
    func handler(_ template:[String:Any]){
        for (key,value) in template{
            let parser = Parser()
            parser.parse(key: key)
            switch value {
            case let someInt as Int:
                handler(someInt, parser: parser)
            case let someStr as String:
                handler(someStr, parser: parser)
            case let someDic as [String:Any]:
                handler(someDic)
            case let someArr as [Any]:
                MockLog(someArr)
            default:
                fatalError("类型不匹配")
            }
        }
    }
    
}
