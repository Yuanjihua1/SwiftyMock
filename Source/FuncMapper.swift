//
//  FuncMap.swift
//  Mock
//
//  Created by ZhangJing on 2018/4/9.
//  Copyright © 2018年 xiuye. All rights reserved.
//

import Foundation
import Regex

open class FuncMapper: NSObject {
    
    open func parsed(template : String) -> String {
        
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
                        return self.perform(Selector(selStr+"::"), with: arr[0], with: arr[1]).takeUnretainedValue() as? String
                    }
                }
            }
            
            return nil
        }){
            return result
        }
        
        return template
    }
    
    @objc open func first() -> String{
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
    
    @objc open func last() -> String{
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
    
    @objc open func name()->String{
        return first()+" "+last()
    }
    
    @objc open func cfirst()->String{
        let firstnames = ["王","李","张","刘","陈","杨","赵","黄","周","吴","徐","孙","胡","朱","高","林","何","郭","马","罗","梁","宋","郑","谢","韩","唐","冯","于","董","萧","程","曹","袁","邓","许","傅","沈","曾","彭","吕","苏","卢","蒋","蔡","贾","丁","魏","薛","叶","阎","余","潘","杜","戴","夏","锺","汪","田","任","姜","范","方","石","姚","谭","廖","邹","熊","金","陆","郝","孔","白","崔","康","毛","邱","秦","江","史","顾","侯","邵","孟","龙","万","段","雷","钱","汤","尹","黎","易","常","武","乔","贺","赖","龚","文"]
        return firstnames.randomElement
    }
    
    @objc open func clast() -> String{
        let lastnames = ["伟","芳","娜","秀英","敏","静","丽","强","磊","军","洋","勇","艳","杰","娟","涛","明","超","秀兰","霞","平","刚","桂英"]
        return lastnames.randomElement
    }
    
    @objc open func cname() -> String{
        return cfirst() + clast()
    }
    
    @objc open func currentDate(_ dateFormat: String = "yyyy-MM-dd hh:mm:ss" ) -> String{
        let formatter = DateFormatter.init()
        formatter.dateFormat = dateFormat
        return formatter.string(from: Date())
    }
    
    @objc open func datetime(_ dateFormat: String = "yyyy-MM-dd hh:mm:ss")->String{
        let randomTime = TimeInterval(arc4random_uniform(UInt32.max))
        let date = Date(timeIntervalSince1970: randomTime)
        let formatter = DateFormatter.init()
        formatter.dateFormat = dateFormat
        return formatter.string(from: date)
    }
    
    @objc open func date(_ dateFormat: String = "yyyy-MM-dd") -> String{
        return datetime(dateFormat)
    }
    
    @objc open func time(_ dateFormat: String = "hh:mm:ss") -> String{
        return time(dateFormat)
    }
    
    @objc open func imageUrl(_ width: String,_ height: String) -> String{
        return "http://lorempixel.com/\(width)/\(height)/"
    }
    
    @objc open func address() -> String{
        var returnValue = ""
        
        let prov = Address.provinces.randomElement
        let city = Address.cities(in: prov).randomElement
        let count = Address.counties(in: city).randomElement
        
        returnValue = "\(prov) \(city) \(count)"
        
        return returnValue
    }
    
    @objc open func ctext(_ min: String,_ max: String) -> String{
        var returnValue = ""
        
        var DICT_KANZI = "的一是在不了有和人这中大为上个国我以要他时来用们生到作地于出就分对成会可主发年动同工也能下过子说产种面而方后多定行学法所民得经十三之进着等部度家电力里如水化高自二理起小物现实加量都两体制机当使点从业本去把性好应开它合还因由其些然前外天政四日那社义事平形相全表间样与关各重新线内数正心反你明看原又么利比或但质气第向道命此变条只没结解问意建月公无系军很情者最立代想已通并提直题党程展五果料象员革位入常文总次品式活设及管特件长求老头基资边流路级少图山统接知较将组见计别她手角期根论运农指几九区强放决西被干做必战先回则任取据处队南给色光门即保治北造百规热领七海口东导器压志世金增争济阶油思术极交受联什认六共权收证改清己美再采转更单风切打白教速花带安场身车例真务具万每目至达走积示议声报斗完类八离华名确才科张信马节话米整空元况今集温传土许步群广石记需段研界拉林律叫且究观越织装影算低持音众书布复容儿须际商非验连断深难近矿千周委素技备半办青省列习响约支般史感劳便团往酸历市克何除消构府称太准精值号率族维划选标写存候毛亲快效斯院查江型眼王按格养易置派层片始却专状育厂京识适属圆包火住调满县局照参红细引听该铁价严龙飞"
        
        let chars = DICT_KANZI.characters.map(String.init)
        
        let charcount = Int.random(in: Int(min)!...Int(max)!)
        
        for _ in 1 ... charcount{
            returnValue += chars.randomElement
        }
        
        return returnValue
    }
    
}


