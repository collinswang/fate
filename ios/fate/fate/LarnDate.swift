//
//  LarnDate.swift
//  fate
//
//  Created by xieyang on 15/12/1.
//  Copyright © 2015年 xieyang. All rights reserved.
//

import Foundation

class LarnDate {
    
}




extension NSData {
//    func numberOfDaysInCurrentMonth() -> UInt {
//        // 频繁调用 [NSCalendar currentCalendar] 可能存在性能问题
//        return NSCalendar.currentCalendar().rangeOfUnit(NSDayCalendarUnit, inUnit: NSMonthCalendarUnit, forDate: self).length
//    }
    
    
    //判断日期是今天,明天,后天,周几
    
    func compareIfTodayWithDate() -> String {
//        var todate: NSDate = NSDate()
        
        let dateFormatter:NSDateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "yyyy/MM/dd";
        let dateString:String = dateFormatter.stringFromDate(NSDate());
        var dates:[String] = dateString.componentsSeparatedByString("/")
        let currentYear  = dates[0]
        let currentMonth = dates[1]
        let currentDay   = dates[2]
        
        
        print(currentDay)
        print(currentMonth)
        print("\(currentYear):\(currentDay):\(currentMonth)")
        
//        var year =
//        todate.
        
        //今天
//        var calendar: NSCalendar = NSCalendar(calendarIdentifier: NSChineseCalendar)
//        var comps_today: NSDateComponents = calendar.components((NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit), fromDate: todate)
//        var comps_other: NSDateComponents = calendar.components((NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit), fromDate: self)
        
        
        return ""
    }
    
  
}

  func getWeekStringFromInteger(week: Int) -> String {
    var str_week = ""
    switch week {
    case 1:
        str_week = "周日"
        break
    case 2:
        str_week = "周一"
        break
    case 3:
        str_week = "周二"
        break
    case 4:
        str_week = "周三"
        break
    case 5:
        str_week = "周四"
        break
    case 6:
        str_week = "周五"
        break
    case 7:
        str_week = "周六"
        break
    default:
        break
    }
    return str_week
}