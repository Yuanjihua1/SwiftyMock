//
//  Address.swift
//  Mock
//
//  Created by ZhangJing on 2018/4/19.
//  Copyright © 2018年 xiuye. All rights reserved.
//

import Foundation

struct Address{
    static var json : Any {
        guard let url = Bundle.main.url(forResource: "address", withExtension: "json") else { fatalError() }
        let data = try! Data.init(contentsOf: url)
        let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
        return json
    }
    
    static var provinces : [String]{
        var returnArr : [String] = []
        for item in json as! [[String:Any]] {
            returnArr.append(item["name"] as! String)
        }
        return returnArr
    }
    
    static func cities(in provices : String) -> [String]{
        var returnValue : [String] = []
        
        for item in json as! [[String:Any]]{
            if let cityName = item["name"] as? String, cityName == provices{
                for child in item["children"] as! [[String:Any]]{
                    returnValue.append( child["name"] as! String)
                }
            }
        }
        
        return returnValue
    }
    
    static func counties(in city: String) -> [String]{
        var returnValue : [String] = []
        
        for item in json as! [[String:Any]]{
            
                for provchild in item["children"] as! [[String:Any]]{
                    
                    if let childCity = provchild["name"] as? String, childCity == city{
                        if let cityNode = provchild["children"] as? [[String:Any]]{
                            for childitem in cityNode{
                                returnValue.append(childitem["name"] as! String)
                            }
                        }else{
                            returnValue.append("")
                        }
                    }
                }
            
        }

        return returnValue
    }
}
