////
////  Test.swift
////  fate
////
////  Created by xieyang on 15/12/2.
////  Copyright © 2015年 xieyang. All rights reserved.
////
//
//import Foundation
//
//
//class ChinaCalendar {
//            //默认系统当前日期
//    var dtvalue = NSData()
//            //用来计算农历的初始日期
//    var baseDate = new DateTime(1900, 1, 31);
//    var chinaYear:Int       //农历年
//    var chinaMonth:Int      //农历月
//    var doubleMonth:Int     //闰月
//    var isLeap:Bool         //是否闰月标记
//    var chinaDay:Int        //农历日
//            /// <summary>
//            /// 获取或设置类中应用日期
//            /// </summary>
//          //            #region 农历的静态数据
//            let ChinaCalendarInfo = [ 0x04bd8,0x04ae0,0x0a570,0x054d5,0x0d260,0x0d950,0x16554,0x056a0,0x09ad0,0x055d2,
//            0x04ae0,0x0a5b6,0x0a4d0,0x0d250,0x1d255,0x0b540,0x0d6a0,0x0ada2,0x095b0,0x14977,
//            0x04970,0x0a4b0,0x0b4b5,0x06a50,0x06d40,0x1ab54,0x02b60,0x09570,0x052f2,0x04970,
//            0x06566,0x0d4a0,0x0ea50,0x06e95,0x05ad0,0x02b60,0x186e3,0x092e0,0x1c8d7,0x0c950,
//            0x0d4a0,0x1d8a6,0x0b550,0x056a0,0x1a5b4,0x025d0,0x092d0,0x0d2b2,0x0a950,0x0b557,
//            0x06ca0,0x0b550,0x15355,0x04da0,0x0a5b0,0x14573,0x052b0,0x0a9a8,0x0e950,0x06aa0,
//            0x0aea6,0x0ab50,0x04b60,0x0aae4,0x0a570,0x05260,0x0f263,0x0d950,0x05b57,0x056a0,
//            0x096d0,0x04dd5,0x04ad0,0x0a4d0,0x0d4d4,0x0d250,0x0d558,0x0b540,0x0b6a0,0x195a6,
//            0x095b0,0x049b0,0x0a974,0x0a4b0,0x0b27a,0x06a50,0x06d40,0x0af46,0x0ab60,0x09570,
//            0x04af5,0x04970,0x064b0,0x074a3,0x0ea50,0x06b58,0x055c0,0x0ab60,0x096d5,0x092e0,
//            0x0c960,0x0d954,0x0d4a0,0x0da50,0x07552,0x056a0,0x0abb7,0x025d0,0x092d0,0x0cab5,
//            0x0a950,0x0b4a0,0x0baa4,0x0ad50,0x055d9,0x04ba0,0x0a5b0,0x15176,0x052b0,0x0a930,
//            0x07954,0x06aa0,0x0ad50,0x05b52,0x04b60,0x0a6e6,0x0a4e0,0x0d260,0x0ea65,0x0d530,
//            0x05aa0,0x076a3,0x096d0,0x04bd7,0x04ad0,0x0a4d0,0x1d0b6,0x0d250,0x0d520,0x0dd45,
//            0x0b5a0,0x056d0,0x055b2,0x049b0,0x0a577,0x0a4b0,0x0aa50,0x1b255,0x06d20,0x0ada0,
//            0x14b63
//            ];
//             let Animals = [ "鼠", "牛", "虎", "兔", "龙", "蛇", "马", "羊", "猴", "鸡", "狗", "猪" ];
//             let dayStr1 = [ "日", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十" ];
//             let dayStr2 = [ "初", "十", "廿", "卅", "□" ];
//             let chinaMonthName = [ "正月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一", "腊月" ];
//             let Gan = [ "甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸" ];
//             let Zhi = [ "子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥" ];
//    
//            let  sTermInfo = [ 0, 21208, 42467, 63836, 85337, 107014, 128867, 150921, 173149, 195551, 218072, 240693, 263343, 285989, 308563, 331033, 353350, 375494, 397447, 419210, 440795, 462224, 483532, 504758 ];
//             let solarTermName = [
//            "小寒", "大寒", "立春", "雨水","惊蛰", "春分", "清明", "谷雨","立夏", "小满", "芒种", "夏至",
//            "小暑", "大暑", "立秋", "处暑","白露", "秋分", "寒露", "霜降","立冬", "小雪", "大雪", "冬至"];
//            
////            #endregion
////            #region 构造函数
////    init() { Initializue() }
////    
////    init(date:NSData) {
////        dtvalue = Convert.ToDateTime(date.ToShortDateString());
////        Initializue();
////    }
////            #endregion
//    func Initializue() {
//        TimeSpan timeSpan = dtvalue - baseDate;
//        let sumdays = Int32(timeSpan.TotalDays);   //86400000=1000*24*60*60
//        let tempdays = 0;
//            //计算农历年
//        for (chinaYear = 1900; chinaYear < 2050 && sumdays > 0; chinaYear++) {
//            tempdays = ChinaYearDays(chinaYear);
//            sumdays -= tempdays;
//        }
//        
//        if (sumdays < 0) {
//            sumdays += tempdays;
//            chinaYear--;
//        }
//            //计算闰月
//        doubleMonth = DoubleMonth(chinaYear);
//        isLeap = false;
//            //计算农历月
//        for (chinaMonth = 1; chinaMonth < 13 && sumdays > 0; chinaMonth++) {
//            //闰月
//            if (doubleMonth > 0 && chinaMonth == (doubleMonth + 1) && isLeap == false) {
//                --chinaMonth;
//                isLeap = true;
//                tempdays = DoubleMonthDays(chinaYear);
//            } else {
//                tempdays = MonthDays(chinaYear, chinaMonth);
//            }
//            //解除闰月
//            if (isLeap == true && chinaMonth == (doubleMonth + 1)) {
//                isLeap = false;
//            }
//            sumdays -= tempdays;
//        }
//            //计算农历日
//        if (sumdays == 0 && doubleMonth > 0 && chinaMonth == doubleMonth + 1) {
//            if (isLeap) {
//                isLeap = false;
//            } else {
//                isLeap = true;
//                --chinaMonth;
//            }
//        }
//        
//        if (sumdays < 0) {
//            sumdays += tempdays;
//            --chinaMonth;
//        }
//        chinaDay = sumdays + 1;
//        //计算节气
////        ComputeSolarTerm();
//    }
//    
//            ///<summary>
//            ///返回农历年的总天数
//            ///</summary>
//            ///<param name="year">农历年</param>
//            ///<returns></returns>
//    func ChinaYearDays(year:Int)->Int {
//        var i:Int
//        var sum = 348;
//        for (i = 0x8000; i > 0x8; i >>= 1) {
//                sum += ((ChinaCalendarInfo[year - 1900] & i) != 0) ? 1 : 0;
//        }
//       return (sum + DoubleMonthDays(year));
//    }
//            ///<summary>
//            ///返回农历年闰月月份1-12 , 没闰返回0
//            ///</summary>
//            ///<param name="year">农历年</param>
//            ///<returns></returns>
//    func DoubleMonth(year:Int)->Int {
//        return (ChinaCalendarInfo[year - 1900] & 0xf);
//    }
//            ///<summary>
//            ///返回农历年闰月的天数
//            ///</summary>
//            ///<param name="year">农历年</param>
//            ///<returns></returns>
//    func DoubleMonthDays(year:Int)->Int {
//        if (DoubleMonth(year) != 0) {
//            return (((ChinaCalendarInfo[year - 1900] & 0x10000) != 0) ? 30 : 29);
//        } else {
//            return (0);
//        }
//        
//    }
//            ///</summary>
//            ///返回农历年月份的总天数
//            ///</summary>
//            ///<param name="year">农历年</param>
//            ///<param name="month">农历月</param>
//            ///<returns></returns>
//    func MonthDays(year:Int, month:Int)->Int {
//        return (((ChinaCalendarInfo[year - 1900] & (0x10000 >> month)) != 0) ? 30 : 29);
//    }
//            //计算属相（生肖）
//    func Animal()->String {
//        return Animals[(chinaYear - 4) % 60 % 12];
//    }
//            //生成农历年字符串
//    func ChinaYear()->String {
//            return (Gan[(chinaYear - 4) % 60 % 10] + Zhi[(chinaYear - 4) % 60 % 12] + "年");
//    }
//            //生成农历月字符串
//    func ChinaMonth()->String {
//        if (isLeap == true) {
//            return "闰" + chinaMonthName[chinaMonth - 1];
//        } else {
//            return chinaMonthName[chinaMonth - 1];
//        }
//    }
//            //生成农历日字符串
//    func ChinaDay() ->String {
//        let s:String
//        switch (chinaDay) {
//            case 10:
//            s = "初十";
//            break;
//            case 20:
//            s = "二十";
//            break;
//            case 30:
//            s = "三十";
//            break;
//            default:
//            s = dayStr2[chinaDay / 10];
//            s += dayStr1[chinaDay % 10];
//            break;
//        }
//        return (s);
//    }
//    
//
// 
//            
//            // 判断y年m月(1,2,..,12,下同)d日是Gregorian历还是Julian历
//            //（opt=1,2,3分别表示标准日历,Gregorge历和Julian历）,是则返回1，是Julian历则返回0，
//            // 若是Gregorge历所删去的那10天则返回-1
//    func  IfGregorian(y:Int, m:Int, d:Int, opt:Int)->Int {
//        if (opt == 1) {
//            if (y > 1582 || (y == 1582 && m > 10) || (y == 1582 && m == 10 && d > 14)) {
//                return (1); // Gregorian
//            } else {
//                if (y == 1582 && m == 10 && d >= 5 && d <= 14) {
//                    return (-1); // 空
//                } else {
//                    return (0); // Julian
//                }
//            }
//        }
//        if (opt == 2) {
//            return (1); // Gregorian
//        }
//        if (opt == 3) {
//            return (0); // Julian
//        }
//        return (-1);
//    }
//}