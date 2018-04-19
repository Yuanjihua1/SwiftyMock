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
                        return self.perform(Selector(selStr+":"), with: arr[0]).takeUnretainedValue() as? String
                    }
                    
                    if arr.count == 2{
                        return self.perform(Selector(selStr+":"), with: arr[0], with: arr[1]).takeUnretainedValue() as? String
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
        let firstNames = [
            // male
            "James", "John", "Robert", "Michael", "William",
            "David", "Richard", "Charles", "Joseph", "Thomas",
            "Christopher", "Daniel", "Paul", "Mark", "Donald",
            "George", "Kenneth", "Steven", "Edward", "Brian",
            "Ronald", "Anthony", "Kevin", "Jason", "Matthew",
            "Gary", "Timothy", "Jose", "Larry", "Jeffrey",
            "Frank", "Scott", "Eric","Mary", "Patricia", "Linda", "Barbara", "Elizabeth",
            "Jennifer", "Maria", "Susan", "Margaret", "Dorothy",
            "Lisa", "Nancy", "Karen", "Betty", "Helen",
            "Sandra", "Donna", "Carol", "Ruth", "Sharon",
            "Michelle", "Laura", "Sarah", "Kimberly", "Deborah",
            "Jessica", "Shirley", "Cynthia", "Angela", "Melissa",
            "Brenda", "Amy", "Anna"
        ]
        return firstNames.randomElement
    }
    
    @objc func last() -> String{
        let lastNames = [
            "Smith", "Johnson", "Williams", "Brown", "Jones",
            "Miller", "Davis", "Garcia", "Rodriguez", "Wilson",
            "Martinez", "Anderson", "Taylor", "Thomas", "Hernandez",
            "Moore", "Martin", "Jackson", "Thompson", "White",
            "Lopez", "Lee", "Gonzalez", "Harris", "Clark",
            "Lewis", "Robinson", "Walker", "Perez", "Hall",
            "Young", "Allen"
        ]
        return lastNames.randomElement
    }
    
    @objc func name()->String{
        return first()+" "+last()
    }
    
    @objc func cfirst()->String{
        let firstnames = ["王","李","张","刘","陈","杨","赵","黄","周","吴","徐","孙","胡","朱","高","林","何","郭","马","罗","梁","宋","郑","谢","韩","唐","冯","于","董","萧","程","曹","袁","邓","许","傅","沈","曾","彭","吕","苏","卢","蒋","蔡","贾","丁","魏","薛","叶","阎","余","潘","杜","戴","夏","锺","汪","田","任","姜","范","方","石","姚","谭","廖","邹","熊","金","陆","郝","孔","白","崔","康","毛","邱","秦","江","史","顾","侯","邵","孟","龙","万","段","雷","钱","汤","尹","黎","易","常","武","乔","贺","赖","龚","文"]
        return firstnames.randomElement
    }
    
    @objc func clast() -> String{
        let lastnames = ["伟","芳","娜","秀英","敏","静","丽","强","磊","军","洋","勇","艳","杰","娟","涛","明","超","秀兰","霞","平","刚","桂英"]
        return lastnames.randomElement
    }
    
    @objc func cname() -> String{
        return cfirst() + clast()
    }
    
    @objc func currentDate(_ dateFormat: String = "yyyy-MM-dd hh:mm:ss" ) -> String{
        let formatter = DateFormatter.init()
        formatter.dateFormat = dateFormat
        return formatter.string(from: Date())
    }
}


