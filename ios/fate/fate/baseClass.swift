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
        let userInfo = NSUserDefaults()
        userInfo.setValue(value, forKey: key)
    }
    
    func cacheGetString(key: String) ->String{
        let userInfo = NSUserDefaults()
        let tmpSign = userInfo.stringForKey(key)
        return tmpSign!
    }
    
  
}
