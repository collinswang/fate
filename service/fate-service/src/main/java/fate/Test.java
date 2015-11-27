package fate;

import java.util.Calendar;

import fate.entity.Birthday;
import fate.utils.LunarCalendar;

public class Test {

    public static void main(String[] args) {
        String srcDate = "2015-9-27 0:12";

        // 转换成农历的日期

        Birthday birt = new Birthday(srcDate);
//        LunarCalendar lunar = new LunarCalendar(2015,9,27);
        LunarCalendar lunar = new LunarCalendar(birt);
        lunar = new LunarCalendar();

        int day = lunar.lunarDay;
        int month = lunar.lunarMonth;
        int year = lunar.lunarYear;

        int num = 0;
        for (int i = month; i < 13; i++) {
            num += lunar.lunarMonthDayCount(year, i);
        }

        String str = "阳历 " + lunar.get(Calendar.YEAR) + "/" + (1 + lunar.get(Calendar.MONTH))
                           + "/" + lunar.get(Calendar.DAY_OF_MONTH);
        str += "\n生肖 " + lunar.animalOfYear;
        str += "\n农历 " + lunar.chineseDateString;
        str += "\n传统农历 " + lunar.chineseYearName + "年" + lunar.chineseMonthName + "月"
                           + lunar.chineseDayName + "日" + lunar.chineseHourName + "時";
        if (lunar.isLunarLeapMonth) {
            str += "\n闰月 " + lunar.lunarLeapMonth;
        }
        if (lunar.isHoliday) {
            str += "\n假日 " + lunar.isHoliday;
        }
        if (lunar.isSolarTermInfo) {
            str += "\n节气 " + lunar.solarTermInfo;
        }
        if (lunar.isLunarFestival) {
            str += "\n传统节日" + lunar.lunarFestival + "!";
        }
        str += "\n离过年还有:" + (num - day) + "天";
        System.out.println(str);

    }

}
