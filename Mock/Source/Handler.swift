//
//  Handler.swift
//  Mock
//
//  Created by ZhangJing on 2018/3/30.
//  Copyright © 2018年 xiuye. All rights reserved.
//

import Foundation

class Handler {
    func gen(template: String,name:String,context:String){
        let rule = Parser.parser(name)
        let type = Parser.type(template)
    }
}
