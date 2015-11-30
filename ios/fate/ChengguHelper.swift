//
//  fdsfs.swift
//  fate
//
//  Created by xieyang on 15/11/26.
//  Copyright (c) 2015年 xieyang. All rights reserved.
//

import Foundation


class ChengguHelper {
    
    
    var years = [0, 12, 9, 6, 7,12, 5, 9, 8, 7, 8, 15, 9,
        16, 8, 8, 19, 12, 6, 8, 7, 5, 15, 6, 16,
        15, 7, 9, 12, 10, 7, 15, 6, 5, 14, 14, 9,
        7, 7, 9, 12, 8, 7, 13, 5, 14, 5, 9, 17,
        5, 7, 12, 8, 8, 6, 19, 6, 8, 16, 10, 6];
    var months = [0, 6, 7, 18, 9, 5, 16, 9, 15, 18, 8, 9, 5 ]
    var days = [ 0,5, 10, 8, 15, 16, 15, 8, 16, 8, 16, 19, 17, 8, 17, 10, 8, 9, 18, 5, 15,
    10, 9, 8, 9, 15, 18, 7, 8, 16, 6 ]
    var hours = [0,16, 6, 7, 10, 9, 16, 10, 8, 8, 9, 6, 6 ]
    
    var liangle=["","一两","二两","三两","四两","五两","六两","七两"]
    var qianle=["","一钱","二钱","三钱","四钱","五钱","六钱","七钱","八钱","九钱"]
    
  
    
    func gu(year: Int, month: Int , day: Int, hour: Int) ->(res:String,msg:String){
        let index = (year+60) % 60
        let count = years[index]+months[month]+days[day]+hours[hour]
       
        let path = NSBundle.mainBundle().pathForResource("chenggusuanming.plist", ofType: nil)
        let myDict = NSDictionary(contentsOfFile: path!)
        
        print("\n---------------------------\n", terminator: "")
      
        let msg = recave(count)
        return (myDict?.objectForKey("\(count)") as! String, msg)
    }
    
    
    func recave(num: Int) -> String{
//        num.lengthOfBytesUsingEncoding("utf8")
        
        if(num < 21 || num > 72) {
            return "error"
        }
    
        let uIndex = num%10
        let hIndex = num/10%10
        let str = liangle[hIndex] + qianle[uIndex]
        
    
        
        return str
    }
    
}

extension String {
    
    // readonly computed property
    var length: Int {
//        return countElements(self)
        return sizeofValue(self)
    }
    
    
}