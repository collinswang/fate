package fate.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Birthday {

    /** 出生年 */
    private Integer year;

    /** 出生月 */
    private Integer month;

    /** 出生日 */
    private Integer day;

    /** 出生的当天哪个小时 */
    private Integer hour;

    /** 分钟 */
    private Integer minute;

    public Birthday() {

    }

    public Birthday(String srcDate) {
        init(srcDate);
    }

    public void init(String srcDate) {

        SimpleDateFormat dateFormat = new SimpleDateFormat("yy-MM-dd hh:mm");
        Date date = null;
        try {
            date = dateFormat.parse(srcDate);
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            
            year = cal.get(Calendar.YEAR);
            month = cal.get(Calendar.MONTH);
            day = cal.get(Calendar.DAY_OF_MONTH);
            hour = cal.get(Calendar.HOUR_OF_DAY);
            minute = cal.get(Calendar.MINUTE);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    public Integer getDay() {
        return day;
    }

    public void setDay(Integer day) {
        this.day = day;
    }

    public Integer getHour() {
        return hour;
    }

    public void setHour(Integer hour) {
        this.hour = hour;
    }

    public Integer getMinute() {
        return minute;
    }

    public void setMinute(Integer minute) {
        this.minute = minute;
    }

    public String toString() {
        return "出生年月:" + this.year + "-" + this.month + "-" + this.day + " " + this.hour;
    }

}
