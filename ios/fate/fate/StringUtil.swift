//
//  StringUtil.swift
//  fate
//
//  Created by xieyang on 15/12/21.
//  Copyright © 2015年 xieyang. All rights reserved.
//

import Foundation

class StringUtils {
    
    
    func numToString(num:String) -> String {
        
        var str = "第"
        
        if (num.characters.count == 1) {
            str += numToChina(num)
        } else {
            let ge=(num as NSString).substringWithRange(NSMakeRange(0, 1))
            str += numToChina(ge) + "十"
            let shi = (num as NSString).substringWithRange(NSMakeRange(1, 1))
            str += numToChina(shi)
            
        }
        str += "签"
        
        return str;
    }
    
    func numToChina(str:String) ->String {
        
        
        let num:Int = Int(str)!
        
        switch num {
        case 1:
            return "一"
        case 2:
            return "二"
        case 3:
            return "三"
        case 4:
            return "四"
        case 5:
            return "五"
        case 6:
            return "六"
        case 7:
            return "七"
        case 8:
            return "八"
        case 9:
            return "九"
        case 0:
            return ""
        default:
            return ""
        }
        
        
    }
    
}

