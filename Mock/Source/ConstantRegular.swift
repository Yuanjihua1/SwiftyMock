//
//  ConstantRegular.swift
//  Mock
//
//  Created by ZhangJing on 2018/3/30.
//  Copyright © 2018年 xiuye. All rights reserved.
//

import Foundation

enum ConstantRegular : String {
    case key = "(.+)|(?:+(d+)|([+-]?d+-?[+-]?d*)?(?:.(d+-?d*))?)"
    case range = "([+-]?d+)-?([+-]?d+)?"
    case placeholder = "\\*@([^@#%&()?s]+)(?:((.*?)))?"
}
