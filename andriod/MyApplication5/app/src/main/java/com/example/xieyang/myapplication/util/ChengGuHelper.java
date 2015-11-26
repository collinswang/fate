package com.example.xieyang.myapplication.util;


import android.util.Log;

import com.example.xieyang.myapplication.entity.Birthday;
import com.example.xieyang.myapplication.results.ChengGuResult;

public class ChengGuHelper {

    private static final int years[] = { 0, 6, 8, 7, 5, 15, 6, 16, 15, 7, 9, 12, 10, 7, 15, 6, 5, 14, 14, 9, 7, 7,
            9, 12, 8, 7, 13, 5, 14, 5, 9, 17, 5, 7, 12, 8, 8, 6, 19, 6, 8, 16, 10, 6, 12, 9, 6, 7,
            12, 5, 9, 8, 7, 8, 15, 9, 16, 8, 8, 19, 12 };
    private static final int months[] = { 0, 6, 7, 18, 9, 5, 16, 9, 15, 18, 8, 9, 5 };
    private static final int days[] = { 0, 5, 10, 8, 15, 16, 15, 8, 16, 8, 16, 19, 17, 8, 17, 10, 8, 9, 18, 5, 15,
            10, 9, 8, 9, 15, 18, 7, 8, 16, 6 };
    private static final int hours[] = { 0, 0, 6, 7, 10, 9, 16, 10, 8, 8, 9, 6, 6, 16 };

    public static String Chenggu(Birthday birth) {
        Log.i("info",birth.toString());
        Integer day;
        if (birth.getHour() % 2 == 0) {
            day = (birth.getHour() + 2) / 2;
        } else {
            day = (birth.getHour() + 3) / 2;
        }
        Integer all = years[(birth.getYear() - 1821) % 60 + 1] + months[birth.getMonth()] + days[birth.getDay()]
               + hours[day];
        
        return "你的命有" + all / 10 + "两" + all % 10 + "钱!\n\n" + ChengGuResult.getResult(all);
    }


}
