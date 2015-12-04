//
//  Date.swift
//  dfsfd
//
//  Created by xieyang on 15/12/3.
//  Copyright © 2015年 xieyang. All rights reserved.
//

import Foundation


class Date{
    let lunarInfo = [ 0x4bd8, 0x4ae0, 0xa570, 0x54d5, 0xd260, 0xd950, 0x5554, 0x56af, 0x9ad0, 0x55d2, 0x4ae0,
        0xa5b6, 0xa4d0, 0xd250, 0xd295, 0xb54f, 0xd6a0, 0xada2, 0x95b0, 0x4977, 0x497f, 0xa4b0, 0xb4b5, 0x6a50,
        0x6d40, 0xab54, 0x2b6f, 0x9570, 0x52f2, 0x4970, 0x6566, 0xd4a0, 0xea50, 0x6a95, 0x5adf, 0x2b60, 0x86e3,
        0x92ef, 0xc8d7, 0xc95f, 0xd4a0, 0xd8a6, 0xb55f, 0x56a0, 0xa5b4, 0x25df, 0x92d0, 0xd2b2, 0xa950, 0xb557,
        0x6ca0, 0xb550, 0x5355, 0x4daf, 0xa5b0, 0x4573, 0x52bf, 0xa9a8, 0xe950, 0x6aa0, 0xaea6, 0xab50, 0x4b60,
        0xaae4, 0xa570, 0x5260, 0xf263, 0xd950, 0x5b57, 0x56a0, 0x96d0, 0x4dd5, 0x4ad0, 0xa4d0, 0xd4d4, 0xd250,
        0xd558, 0xb540, 0xb6a0, 0x95a6, 0x95bf, 0x49b0, 0xa974, 0xa4b0, 0xb27a, 0x6a50, 0x6d40, 0xaf46, 0xab60,
        0x9570, 0x4af5, 0x4970, 0x64b0, 0x74a3, 0xea50, 0x6b58, 0x5ac0, 0xab60, 0x96d5, 0x92e0, 0xc960, 0xd954,
        0xd4a0, 0xda50, 0x7552, 0x56a0, 0xabb7, 0x25d0, 0x92d0, 0xcab5, 0xa950, 0xb4a0, 0xbaa4, 0xad50, 0x55d9,
        0x4ba0, 0xa5b0, 0x5176, 0x52bf, 0xa930, 0x7954, 0x6aa0, 0xad50, 0x5b52, 0x4b60, 0xa6e6, 0xa4e0, 0xd260,
        0xea65, 0xd530, 0x5aa0, 0x76a3, 0x96d0, 0x4afb, 0x4ad0, 0xa4d0, 0xd0b6, 0xd25f, 0xd520, 0xdd45, 0xb5a0,
        0x56d0, 0x55b2, 0x49b0, 0xa577, 0xa4b0, 0xaa50, 0xb255, 0x6d2f, 0xada0, 0x4b63, 0x937f, 0x49f8, 0x4970,
        0x64b0, 0x68a6, 0xea5f, 0x6b20, 0xa6c4, 0xaaef, 0x92e0, 0xd2e3, 0xc960, 0xd557, 0xd4a0, 0xda50, 0x5d55,
        0x56a0, 0xa6d0, 0x55d4, 0x52d0, 0xa9b8, 0xa950, 0xb4a0, 0xb6a6, 0xad50, 0x55a0, 0xaba4, 0xa5b0, 0x52b0,
        0xb273, 0x6930, 0x7337, 0x6aa0, 0xad50, 0x4b55, 0x4b6f, 0xa570, 0x54e4, 0xd260, 0xe968, 0xd520, 0xdaa0,
        0x6aa6, 0x56df, 0x4ae0, 0xa9d4, 0xa4d0, 0xd150, 0xf252, 0xd520 ];
    
    let nStr1 = [ "日", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十" ]
    let nStr2 = [ "初", "十", "廿", "卅", "卌" ]
    let Zhi = [ "子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥" ];
    let Gan = [ "甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸" ];
    
    let Animals = [ "鼠", "牛", "虎", "兔", "龍", "蛇", "馬", "羊", "猴", "雞", "狗", "豬" ];
    
    let solarTermBase = [ 4, 19, 3, 18, 4, 19, 4, 19, 4, 20, 4, 20, 6, 22, 6, 22, 6, 22, 7, 22,
        6, 21, 6, 21 ];
    
    let solarTerm = [ "小寒", "大寒", "立春", "雨水", "驚蟄", "春分", "清明", "谷雨", "立夏", "小滿", "芒種", "夏至", "小暑", "大暑",
        "立秋", "處暑", "白露", "秋分", "寒露", "霜降", "立冬", "小雪", "大雪", "冬至" ];
    
    
    func initd(des:String) -> Dictionary<String, String> {
        
        let refDate = dateStringToDate(des)
        return initd(refDate)
    }
    
    func initd(des:NSDate) -> Dictionary<String,String> {
        var res:Dictionary<String,String> = Dictionary<String, String>()
        
        var temp:Double = 0
        var i:Int = 0
        let firstNode:Int
        //    var solarTermDate:Int
        let springStartDate:Int = 0 // 該年的立春的日子(用數字來表示,不包括年份和月份)
        
        
        let localeCalendar = NSCalendar.currentCalendar()
        let unitFlags:NSCalendarUnit = [NSCalendarUnit.Year,NSCalendarUnit.Month,NSCalendarUnit.Day,NSCalendarUnit.Hour]
        let localeComp = localeCalendar.components( unitFlags, fromDate: des)
        
        
        let solarYear = localeComp.year;
        let solarMonth = localeComp.month-1;
        let solarDay = localeComp.day;
        let hour = localeComp.hour
        res.updateValue("\(solarYear)", forKey: "solarYear")
        res.updateValue("\(solarMonth)", forKey: "solarMonth")
        res.updateValue("\(solarDay)", forKey: "solarDay")
        
        
        var offset = getTimeMil(1900, month: 1, day: 31)
        offset = (des.timeIntervalSince1970 - offset) / 86400
        
        for i = 1900; i < 2100 && offset > 0; i++  {
            temp = Double(lYearDays(i));
            offset -= temp;
        }
        
        if (offset < 0) {
            offset += temp;
            i--;
        }
        
        let lunarYear = i;
        let lunarLeapMonth = getLunarLeapMonth(i);
        res.updateValue("\(lunarLeapMonth)", forKey: "lunarLeapMonth")
        
        var isLunarLeapMonth = false;
        for i = 1; i < 13 && offset > 0; i++ {
            // 闰月
            if (lunarLeapMonth > 0 && i == (lunarLeapMonth + 1) && isLunarLeapMonth == false) {
                --i;
                isLunarLeapMonth = true;
                temp = Double(leapDays(lunarYear));
            } else {
                temp = Double(lunarMonthDayCount(lunarYear, m: i));
            }
            
            // 解除闰月
            if (isLunarLeapMonth == true && i == (lunarLeapMonth + 1)) {
                isLunarLeapMonth = false;
            }
            
            offset -= temp;
        }
        
        if (offset == 0 && lunarLeapMonth > 0 && i == lunarLeapMonth + 1) {
            if (isLunarLeapMonth) {
                isLunarLeapMonth = false;
            } else {
                isLunarLeapMonth = true;
                --i;
            }
        }
        
        if (offset < 0) {
            offset += temp;
            --i;
        }
        
        let lunarMonth = i;
        var lunarDay = Int(offset) + 1;
        if (hour == 23) {
            lunarDay++;
        }
        var chineseDateString:String
        if (isLunarLeapMonth) {
            chineseDateString = "润\( numToChineseNum(lunarMonth))月\( dateNumToChineseDateNum(Int(lunarDay)))";
        } else {
            chineseDateString = "\(numToChineseNum(lunarMonth) )月\(dateNumToChineseDateNum(Int(lunarDay)))";
        }
        
        res.updateValue("\(lunarYear)", forKey: "lunarYear")
        res.updateValue("\(lunarMonth)", forKey: "lunarMonth")
        res.updateValue("\(lunarDay)", forKey: "lunarDay")
        
        
        var chineseYearName:String
        var animalOfYear:String
        //////// 年柱 1900年立春後為庚子年(60進制36)
        if (solarMonth < 2) {
            chineseYearName = getCyclical(solarYear - 1900 + 36 - 1);
            animalOfYear = getAnimalOfYear(solarYear - 1);
        } else {
            chineseYearName = getCyclical(solarYear - 1900 + 36);
            animalOfYear = getAnimalOfYear(solarYear);
        }
        
        res.updateValue(animalOfYear, forKey: "animalOfYear")
        res.updateValue(chineseYearName, forKey: "chineseYearName")
        
        //    springStartDate = sTerm(solarYear, 2); // 立春日期
        // 依節氣調整二月分的年柱, 以立春為界
        if (solarMonth == 1 && (solarDay) >= springStartDate) {
            chineseYearName = getCyclical(solarYear - 1900 + 36);
            animalOfYear = getAnimalOfYear(solarYear);
        }
        chineseDateString = chineseYearName + "年" + chineseDateString;
        //////// 月柱 1900年1月小寒以前為 丙子月(60進制12)
        
        res.updateValue(chineseDateString, forKey: "chineseDateString")
        firstNode = sTerm(solarYear, n: solarMonth * 2); // 傳回當月「節」為幾日開始
        
        var chineseMonthName:String
        // 依節氣月柱, 以「節」為界
        if (solarDay >= firstNode) {
            chineseMonthName = getCyclical((solarYear - 1900) * 12 + solarMonth + 13);
        } else {
            chineseMonthName = getCyclical((solarYear - 1900) * 12 + solarMonth + 12);
        }
        
        res.updateValue(chineseMonthName, forKey: "chineseMonthName")
        //    var dayCyclical = new GregorianCalendar(solarYear, solarMonth, 1).getTime().getTime();
        var dayCyclical = getTimeMil(solarYear, month: solarMonth+1, day: 1)
        //        print("\(dayCyclical) 周期是")
        dayCyclical = dayCyclical / 86400 + 25567 + 10;
        
        // 日柱
        let chineseDayName = getCyclical(Int(Double(dayCyclical) + Double(solarDay)));
        res.updateValue(chineseDayName, forKey: "chineseDayName")
        // 时柱
        let chineseHourName = getChineseHourName(hour);
        res.updateValue(chineseHourName, forKey: "chineseHourName")
        
        var solarTermInfo:String = ""
        
        var  solarTermDate = sTerm(solarYear, n: solarMonth * 2);
        //         節氣
        if (solarTermDate == solarDay) {
            solarTermInfo = solarTerm[solarMonth * 2];
            
        } else {
            solarTermDate = sTerm(solarYear, n: solarMonth * 2 + 1);
            if (solarTermDate == solarDay) {
                solarTermInfo = solarTerm[solarMonth * 2 + 1];
                
            }
        }
        // print("节气信息：\(solarTermInfo)")
        res.updateValue(solarTermInfo, forKey: "solarTermInfo")
        return res
    }
    
    
    
    func lYearDays(y:Int)->Int {
        var i:Int
        var sum = 348;
        for (i = 0x8000; i > 0x8; i=i/2) {
            if ((lunarInfo[y - 1900] & i) > 0) {
                sum += 1;
            }
        }
        return (sum + leapDays(y));
    }
    
    func leapDays(y:Int)->Int {
        if (getLunarLeapMonth(y) != 0) {
            return ((lunarInfo[y - 1899] & 0xf) == 0xf ? 30 : 29);
        } else {
            return 0;
        }
    }
    
    func getLunarLeapMonth(y:Int) ->Int{
        //        print(y)
        let lm = lunarInfo[y - 1900] & 0xf;
        return (lm == 0xf ? 0 : lm);
    }
    
    func lunarMonthDayCount(y:Int, m:Int)->Int {
        if ((lunarInfo[y - 1900] & (0x10000 >> m)) > 0) {
            return 30;
        } else {
            return 29;
        }
    }
    
    func numToChineseNum( d:Int)->String {
        var s:String
        if (d < 10) {
            s = nStr1[d];
        } else {
            s = nStr2[(d / 10)];
            if ((d % 10) > 0) {
                s += nStr1[d % 10];
            }
        }
        return s;
    }
    
    
    
    func getChineseHourName(h:Int)->String {
        var i = -1;
        if ((h == 23) || (h == 0)) {
            i = 0;
        } else {
            
            i = Int(round(Double(h)/Double(2)))
        }
        return Zhi[i];
    }
    
    
    func dateNumToChineseDateNum(d:Int) ->String {
        var s:String
        
        switch (d) {
        case 10:
            s = "初十";
            break;
        case 20:
            s = "二十";
            break;
        case 30:
            s = "三十";
            break;
        default:
            s = nStr2[Int((d / 10))];
            s += nStr1[d % 10];
            break;
        }
        return (s);
    }
    
    /**
     * 傳回天干地支
     *
     * @param num
     *            傳入 offset
     * @return 傳回干支, 0=甲子
     */
    func getCyclical(num:Int)->String {
        
        return (Gan[num % 10] + Zhi[num % 12]);
    }
    
    
    func getAnimalOfYear(y:Int)->String {
        
        return Animals[(y - 4) % 12];
    }
    
    func getTimeMil(year:Int,month:Int,day:Int)->Double{
        
        let refStr = "\(year)-\(month)-\(day)"
        let refDate = dateStringToDate(refStr)
        return (refDate.timeIntervalSince1970)
    }
    
    func sTerm(y:Int, n:Int)->Int {
        
        let solarTermIdx = "0123415341536789:;<9:=<>:=1>?012@015@015@015AB78CDE8CD=1FD01GH01GH01IH01IJ0KLMN;LMBEOPDQRST0RUH0RVH0RWH0RWM0XYMNZ[MB\\]PT^_ST`_WH`_WH`_WM`_WM`aYMbc[Mde]Sfe]gfh_gih_Wih_WjhaWjka[jkl[jmn]ope]qph_qrh_sth_W";
        let solarTermOS = "211122112122112121222211221122122222212222222221222122222232222222222222222233223232223232222222322222112122112121222211222122222222222222222222322222112122112121222111211122122222212221222221221122122222222222222222222223222232222232222222222222112122112121122111211122122122212221222221221122122222222222222221211122112122212221222211222122222232222232222222222222112122112121111111222222112121112121111111222222111121112121111111211122112122112121122111222212111121111121111111111122112122112121122111211122112122212221222221222211111121111121111111222111111121111111111111111122112121112121111111222111111111111111111111111122111121112121111111221122122222212221222221222111011111111111111111111122111121111121111111211122112122112121122211221111011111101111111111111112111121111121111111211122112122112221222211221111011111101111111110111111111121111111111111111122112121112121122111111011111121111111111111111011111111112111111111111011111111111111111111221111011111101110111110111011011111111111111111221111011011101110111110111011011111101111111111211111001011101110111110110011011111101111111111211111001011001010111110110011011111101111111110211111001011001010111100110011011011101110111110211111001011001010011100110011001011101110111110211111001010001010011000100011001011001010111110111111001010001010011000111111111111111111111111100011001011001010111100111111001010001010000000111111000010000010000000100011001011001010011100110011001011001110111110100011001010001010011000110011001011001010111110111100000010000000000000000011001010001010011000111100000000000000000000000011001010001010000000111000000000000000000000000011001010000010000000";
        // return(solarTermBase[n] + Math.floor( solarTermOS.charAt( (
        // Math.floor(solarTermIdx.charCodeAt(y-1900)) - 48) * 24 + n ) ) );
        var index = y - 1900;
        //    let temp = solarTermIdx.getBytes()[index];
        
        var someInts = [UInt8]()
        
        for scalar in solarTermIdx.utf8 {
            someInts.append(scalar)
        }
        let temp = someInts[index]
        index = Int(temp);
        index = (index - 48) * 24 + n;
        
        
        var solarTermOSints = [UInt8]()
        for scalar in solarTermOS.utf8 {
            solarTermOSints.append(scalar)
        }
        
        var result = Int(solarTermOSints[index]) - 48; // convert char to int
        
        result += solarTermBase[n];
        
        return result;
    }
    
    
    
    
    func dateStringToDate(des:String) -> NSDate{
        if (!des.containsString("-")) {
            return NSDate()
        }
        if (des.containsString(":")) {
            return StringToDate(des, format: "yyyy-MM-dd HH:mm:ss")
        }
        return StringToDate(des, format: "yyyy-MM-dd")
    }
    
    func StringToDate(des:String, format:String)->NSDate{
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        let refDate = dateFormatter.dateFromString(des)
        return refDate!
    }
    
    
    func getTodayInfo(strDate:String) -> String {
        let des = dateStringToDate(strDate)
        return getTodayInfo(des)
    }
    
    func getTodayInfo() -> String {
        return getTodayInfo(NSDate())
    }
    
    func getTodayInfo(des: NSDate) -> String {
        
        let res = initd(des)
        
        let monthstr = res["lunarMonth"]
        
        var month = 0
        if (monthstr != nil) {
            month = Int(monthstr!)!
        }
        
        let yearStr = res["lunarYear"]
        var year = 0
        if(yearStr != nil) {
            year = Int(yearStr!)!
        }
        
        let day = Int(res["lunarDay"]!)!
        
        var msg = "阳历: \(res["solarYear"]!)-\(res["solarMonth"]!)-\(res["solarDay"]!)\n农历: \(res["chineseDateString"]!)时\n生肖: \(res["animalOfYear"]!)\n"
        msg += "四柱: \(res["chineseYearName"]!) \(res["chineseMonthName"]!) \(res["chineseDayName"]!) \(res["chineseHourName"]!)\n"
        if((res["solarTermInfo"]!) != "") {
            msg += "节气: \(res["solarTermInfo"]!)\n"
        }
        if((Int(res["lunarLeapMonth"]!)) != 0) {
            msg += "闰月: \(res["lunarLeapMonth"]!) \n"
        }
        
        
        var num = 0;
        for var index = month; index < 13; index++ {
            num += lunarMonthDayCount(year, m: index);
        }
        msg +=  "离过年还有:\(num-day)天"
        
        return msg
    }
    
    
}
