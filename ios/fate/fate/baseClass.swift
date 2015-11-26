//
//  baseClass.swift
//  fate
//
//  Created by xieyang on 15/11/26.
//  Copyright (c) 2015年 xieyang. All rights reserved.
//

import Foundation

class bassClass {
    func cacheSetString(key: String, value: String){
        var userInfo = NSUserDefaults()
        userInfo.setValue(value, forKey: key)
    }
    
    func cacheGetString(key: String) ->String{
        var userInfo = NSUserDefaults()
        var tmpSign = userInfo.stringForKey(key)
        return tmpSign!
    }
}
