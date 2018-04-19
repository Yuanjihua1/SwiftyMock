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
        return firstNames[Int.random(in: 0...firstNames.count-1)]
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
        return lastNames[Int.random(in: 0...Int.random(in: 0...lastNames.count-1))]
    }
    
    @objc func address(){
        
    }
}


