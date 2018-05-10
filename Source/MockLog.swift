//
//  MockLog.swift
//  Mock
//
//  Created by 李修冶 on 2018/4/3.
//  Copyright © 2018年 xiuye. All rights reserved.
//

import Foundation

func MockLog(file:String=#file,line:Int=#line,_ items:Any...){
    for item in items {
        print(item, separator: "", terminator: " ")
    }
    print("[",(file as NSString).lastPathComponent,":",line, separator: "", terminator: "]\n")
}
