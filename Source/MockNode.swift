//
//  Node.swift
//  Mock
//
//  Created by ZhangJing on 2018/4/9.
//  Copyright © 2018年 xiuye. All rights reserved.
//

import Foundation

public indirect enum MockNode{
    case number(NSNumber)
    case string(String)
    case list([MockNode])
    case object([String:MockNode])
}

public extension MockNode{
    
    public static func create(by value:Any) -> MockNode{
        switch value {
        case let some as String:
            return MockNode.string(some)
        case let some as NSNumber:
            return MockNode.number(some)
        case let some as [Any]:
            var arr = [MockNode]()
            for item in some {
                arr.append(MockNode.create(by: item))
            }
            return MockNode.list(arr)
        case let some as [String:Any]:
            var dic = [String:MockNode]()
            for (key,value) in some{
                dic[key] = MockNode.create(by: value)
            }
            return MockNode.object(dic)
        default:
            return MockNode.string("this type not json")
        }
    }
    
    public func parsed(_ obj:FuncMapper = FuncMapper()) -> Any{
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

public extension Dictionary {
    public var json : Any? {
        get{
            let data = try! JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
            return json
        }
    }
}
