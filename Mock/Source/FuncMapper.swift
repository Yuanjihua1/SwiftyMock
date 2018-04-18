//
//  FuncMap.swift
//  Mock
//
//  Created by ZhangJing on 2018/4/9.
//  Copyright © 2018年 xiuye. All rights reserved.
//

import Foundation
import Regex

class FuncMapper: NSObject {
    
    func parsed(template : String) -> String {
        
        if let result = RegularExpression.PLACEHOLDER.r?.replaceAll(in: template, using: { (match:Match) -> String? in
            
            let funcstrs = match.subgroups.flatMap({$0})
            if let selStr = funcstrs.first{
                let param = funcstrs[1]
                if param == "" {
                    return self.perform(Selector(selStr)).takeUnretainedValue() as? String
                }else{
                    let arr = param.split(using: ",".r)
                    if arr.count == 1{
                        return self.perform(Selector(selStr), with: arr[0]).takeUnretainedValue() as? String
                    }
                    
                    if arr.count == 2{
                        return self.perform(Selector(selStr), with: arr[0], with: arr[1]).takeUnretainedValue() as? String
                    }
                }
            }
            
            return nil
        }){
            return result
        }
        
        return template
    }
    
    @objc func first() -> String{
        return "李"
    }
    
    @objc func last() -> String{
        return "修冶"
    }
}

class SubMaper: FuncMapper {
    @objc override func first() -> String {
        return "Li"
    }
}


