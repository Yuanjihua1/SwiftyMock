//
//  Constant.swift
//  Mock
//
//  Created by ZhangJing on 2018/4/2.
//  Copyright © 2018年 xiuye. All rights reserved.
//

import Foundation

struct Constant {
    static let GUID = 1
    static let REGULAR_KEY = "(.+)\\|(?:\\+(\\d+)|([\\+\\-]?\\d+-?[\\+\\-]?\\d*)?(?:\\.(\\d+-?\\d*))?)"
    static let REGULAR_RANGE = "([\\+\\-]?\\d+)-?([\\+\\-]?\\d+)?"
    static let REGULAR_PLACEHOLDER = "\\*@([^@#%&()\\?\\s]+)(?:\\((.*?)\\))?"
}
