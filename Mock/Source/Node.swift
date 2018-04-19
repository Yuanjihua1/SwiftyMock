//
//  Node.swift
//  Mock
//
//  Created by ZhangJing on 2018/4/9.
//  Copyright © 2018年 xiuye. All rights reserved.
//

import Foundation

public indirect enum Node{
    case number(NSNumber)
    case string(String)
    case list([Node])
    case object([String:Node])
}

extension Node{
    static func create(by value:Any) -> Node{
        switch value {
        case let some as String:
            return Node.string(some)
        case let some as NSNumber:
            return Node.number(some)
        case let some as [Any]:
            var arr = [Node]()
            for item in some {
                arr.append(Node.create(by: item))
            }
            return Node.list(arr)
        case let some as [String:Any]:
            var dic = [String:Node]()
            for (key,value) in some{
                dic[key] = Node.create(by: value)
            }
            return Node.object(dic)
        default:
            return Node.string("this type not json")
        }
    }
    
    func parsed(_ obj:FuncMapper = FuncMapper()) -> Any{
        switch self {
        case .object(let dic):
            var json = [String:Any]()
            for (key,value) in dic {
                if let rule = Rule.create(from: key){
                    json[rule.key] = rule.parse(node: value).parsed()
                }else{
                    json[key] = value.parsed()
                }
            }
            return json
        case .list(let some):
            var arr = [Any]()
            for item in some{
                arr.append(item.parsed())
            }
            return arr
        case .string(let some):
            return obj.parsed(template: some)
        case .number(let some):
            return some
        }
    }
}

extension Dictionary {
    var json : Any? {
        get{
            let data = try! JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
            return json
        }
    }
}
