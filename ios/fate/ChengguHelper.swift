//
//  fdsfs.swift
//  fate
//
//  Created by xieyang on 15/11/26.
//  Copyright (c) 2015年 xieyang. All rights reserved.
//

import Foundation


class ChengguHelper {
    
    
    var years = [ 0, 6, 8, 7, 5, 15, 6, 16, 15, 7, 9, 12, 10, 7, 15, 6, 5, 14, 14, 9, 7, 7,
    9, 12, 8, 7, 13, 5, 14, 5, 9, 17, 5, 7, 12, 8, 8, 6, 19, 6, 8, 16, 10, 6, 12, 9, 6, 7,
    12, 5, 9, 8, 7, 8, 15, 9, 16, 8, 8, 19, 12 ];
    var months = [ 0, 6, 7, 18, 9, 5, 16, 9, 15, 18, 8, 9, 5 ]
    var days = [ 0, 5, 10, 8, 15, 16, 15, 8, 16, 8, 16, 19, 17, 8, 17, 10, 8, 9, 18, 5, 15,
    10, 9, 8, 9, 15, 18, 7, 8, 16, 6 ]
    var hours = [ 0, 0, 6, 7, 10, 9, 16, 10, 8, 8, 9, 6, 6, 16 ]
    
    
    func gu(year: Int, month: Int , day: Int, hour: Int) ->String{
        var count = years[year] + months[month] + days[day] + hours[hour]
        let msg = "你的命是\(count)"
        println(msg)
        return msg
    }
    
    
}