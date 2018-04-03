//
//  RegularExpress.swift
//  Mock
//
//  Created by ZhangJing on 2018/4/3.
//  Copyright © 2018年 xiuye. All rights reserved.
//

import Foundation

struct RegularExpression {
    static let KEY = "(.+)\\|(?:\\+(\\d+)|([\\+\\-]?\\d+-?[\\+\\-]?\\d*)?(?:\\.(\\d+-?\\d*))?)"
    static let RANGE = "([\\+\\-]?\\d+)-?([\\+\\-]?\\d+)?"
    static let PLACEHOLDER = "\\\\*@([^@#%&()\\?\\s]+)(?:\\((.*?)\\))?"
}
